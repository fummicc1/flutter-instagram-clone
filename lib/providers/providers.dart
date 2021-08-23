import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/firebase/auth_client.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';
import 'package:flutter_instagram/firebase/storage_client.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/post_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// flow errors from ViewModels.
final errorStateProvider = StateProvider<GenericException?>((_) => null);

/// IFirestoreClient
final firestoreClientProvider = StateProvider<IFirestoreClient>((ref) {
  final FirestoreClient firestoreClient =
      FirestoreClient(FirebaseFirestore.instance);
  return firestoreClient;
});

/// IStorageClient
final storageClientProvider = StateProvider<IStorageClient>((ref) {
  final StorageClient storageClient = StorageClient(FirebaseStorage.instance);
  return storageClient;
});

/// IAuthClient
final authClientProvider = StateProvider<IAuthClient>((ref) {
  final AuthClient authClient = AuthClient(FirebaseAuth.instance);
  return authClient;
});

/// Repositories
final imageRepositoryProvider = StateProvider<IImageRepository>((ref) {
  final firestore = ref.watch(firestoreClientProvider).state;
  final storage = ref.watch(storageClientProvider).state;

  final IImageRepository imageRepository = ImageRepository(firestore, storage);
  return imageRepository;
});

final postRepositoryProvider = StateProvider<IPostRepository>((ref) {
  final firestore = ref.watch(firestoreClientProvider).state;
  return PostRepository(firestore);
});

final userRepositoryProvider = StateProvider<IUserRepository>((ref) {
  final firestore = ref.watch(firestoreClientProvider).state;
  return UserRepository(firestore);
});