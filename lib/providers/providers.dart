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
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:flutter_instagram/viewmodels/profile_viewmodel.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:flutter_instagram/viewmodels/app_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// flow errors from ViewModels.
final errorStateProvider = StateProvider<GenericException?>((_) => null);

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

final _uidStreamProvider = StreamProvider<String?>((ref) {
  final auth = ref.watch(_authRepository);
  return auth.uIdStream;
});

final needToLoginProvider = FutureProvider<bool>((ref) async {
  return (await ref.watch(_uidStreamProvider.last)) == null;
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

final appViewModelProvider = Provider<AppViewModel>((ref) {
  return AppViewModel(ref.watch(_authRepository), ref.read);
});

final myProfileStateProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
  final userRepository = ref.watch(_userRepository);
  final postRepository = ref.watch(_postRepository);
  final imageRepository = ref.watch(_imageRepository);
  final errorState = ref.read(errorStateProvider);

  final String userID =
      ref.watch(myProfileUserIdStateProvider).state ?? "unknown userId";

  return ProfileViewModel(
      userRepository, postRepository, imageRepository, errorState,
      userID: userID);
});
