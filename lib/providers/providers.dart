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
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
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
  final firestore = ref.watch(_firestoreClient);
  return AuthRepository(auth, firestore);
});

final _uidStreamProvider = StreamProvider<String?>((ref) {
  final auth = ref.watch(_authRepository);
  return auth.uIdStream;
});

final needToLoginProvider = FutureProvider<bool>((ref) async {
  return (await ref.watch(_uidStreamProvider.last)) == null;
});

final _myUserIdProvider = FutureProvider<String?>((ref) async {
  final uid = await ref.watch(_uidStreamProvider.last);
  if (uid == null) return null;
  return await ref.watch(_authRepository).uidToUserId(uid);
});

final accountRegistrationViewModel = StateNotifierProvider<
    AccountRegistrationViewModel, AccountRegistrationState>((ref) {
  return AccountRegistrationViewModel(ref.watch(_authRepository),
      ref.watch(_userRepository), ref.read(errorStateProvider));
});
