import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/firebase/auth_client.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';
import 'package:flutter_instagram/firebase/storage_client.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/post_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/services/photo_service.dart';
import 'package:flutter_instagram/states/add_new_post_info_state.dart';
import 'package:flutter_instagram/states/login_state.dart';
import 'package:flutter_instagram/states/new_post_state.dart';
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:flutter_instagram/viewmodels/login_viewmodel.dart';
import 'package:flutter_instagram/viewmodels/post/add_new_post_info_viewmodel.dart';
import 'package:flutter_instagram/viewmodels/post/new_post_viewmodel.dart';
import 'package:flutter_instagram/viewmodels/profile_viewmodel.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:flutter_instagram/viewmodels/app_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// flow errors from ViewModels.
final errorStateProvider = StateProvider<GenericException?>((_) => null);

/// Services
final _photoService = Provider<IPhotoService>((ref) => PhotoService());

/// IFirestoreClient
final _firestoreClient = Provider<IFirestoreClient>((ref) {
  final FirestoreClient firestoreClient =
      FirestoreClient(FirebaseFirestore.instance);
  return firestoreClient;
});

/// IStorageClient
final _storageClient = Provider<IStorageClient>((ref) {
  final StorageClient storageClient = StorageClient(FirebaseStorage.instance);
  return storageClient;
});

/// IAuthClient
final _authClient = Provider<IAuthClient>((ref) {
  final AuthClient authClient = AuthClient(FirebaseAuth.instance);
  return authClient;
});

/// Repositories
final _imageRepository = Provider<IImageRepository>((ref) {
  final firestore = ref.watch(_firestoreClient);
  final storage = ref.watch(_storageClient);

  final IImageRepository imageRepository = ImageRepository(firestore, storage);
  return imageRepository;
});

final _postRepository = Provider<IPostRepository>((ref) {
  final firestore = ref.watch(_firestoreClient);
  return PostRepository(firestore);
});

final _userRepository = Provider<IUserRepository>((ref) {
  final firestore = ref.watch(_firestoreClient);
  return UserRepository(firestore);
});

final _authRepository = Provider<IAuthRepository>((ref) {
  final auth = ref.watch(_authClient);
  return AuthRepository(auth);
});

/// UI
final _uidStreamProvider = StreamProvider<String?>((ref) {
  final auth = ref.watch(_authRepository);
  return auth.uIdStream;
});

enum AccountStatus { notLoggedIn, loggedIn, needToRegister }

final accountStatusProvider = FutureProvider<AccountStatus>((ref) async {
  if ((await ref.watch(_uidStreamProvider.last)) == null) {
    return AccountStatus.notLoggedIn;
  }
  if (ref.watch(myProfileUserIdStateProvider).state == null) {
    return AccountStatus.needToRegister;
  }
  return AccountStatus.loggedIn;
});

final _userIdFutureProvider = FutureProvider<String?>((ref) async {
  final uid = await ref.watch(_uidStreamProvider.last);
  if (uid == null) return null;
  try {
    return await ref.watch(_userRepository).uidToUserId(uid);
  } catch (e) {
    print("uid=$uidのユーザが存在しません $e");
    return null;
  }
});

final myProfileUserIdStateProvider = StateProvider<String?>((ref) {
  return ref
      .watch(_userIdFutureProvider)
      .when(data: (d) => d, loading: () => null, error: (err, trace) => null);
});

final accountRegistrationViewModelProvider = StateNotifierProvider<
    AccountRegistrationViewModel, AccountRegistrationState>((ref) {
  return AccountRegistrationViewModel(
      ref.watch(_authRepository), ref.watch(_userRepository), ref.read);
});

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(
      ref.watch(_authRepository), ref.watch(_userRepository), ref.read);
});

final appViewModelProvider = Provider<AppViewModel>((ref) {
  return AppViewModel(ref.watch(_authRepository), ref.read);
});

final myProfileStateProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
  final userRepository = ref.watch(_userRepository);
  final postRepository = ref.watch(_postRepository);
  final imageRepository = ref.watch(_imageRepository);
  final errorState = ref.read(errorStateProvider);

  final String? userID = ref.watch(myProfileUserIdStateProvider).state;

  return ProfileViewModel(
      userRepository, postRepository, imageRepository, errorState,
      userID: userID);
});

/// Current selecting bottomNavigation index
final selectedBottomNavigationIndex = StateProvider<int>((_) => 0);

/// NewPostViewModel
final newPostStateProvider =
    StateNotifierProvider<NewPostViewModel, NewPostState>((ref) {
  final photoService = ref.watch(_photoService);
  const initialState = NewPostState();

  return NewPostViewModel(initialState, photoService);
});

/// AddNewPostInfoViewModel
final addNewPostInfoStateProvider =
    StateNotifierProvider<AddNewPostInfoViewModel, AddNewPostInfoState>((ref) {
  final authRepository = ref.watch(_authRepository);
  final userRepository = ref.watch(_userRepository);
  final postRepository = ref.watch(_postRepository);
  final imageRepository = ref.watch(_imageRepository);
  final imageFile =
      ref.watch(newPostStateProvider.select((state) => state.imageFile));
  final initialState = AddNewPostInfoState(imageFile: imageFile);

  return AddNewPostInfoViewModel(initialState, postRepository, userRepository,
      authRepository, imageRepository, FirebaseFirestore.instance, ref.read);
});
