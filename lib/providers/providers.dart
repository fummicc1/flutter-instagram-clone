import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/firebase/auth_client.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// flow errors from ViewModels.
final errorStateProvider = StateProvider<GenericException?>((_) => null);

final _authClient = Provider((_) => AuthClient(FirebaseAuth.instance));
final _firestoreClient =
    Provider((_) => FirestoreClient(FirebaseFirestore.instance));

final _authRepository = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(_authClient));
});
final _userRepository = Provider<UserRepository>((ref) {
  return UserRepository(ref.watch(_firestoreClient));
});

final accountRegistrationViewModel = StateNotifierProvider<
    AccountRegistrationViewModel, AccountRegistrationState>((ref) {
  return AccountRegistrationViewModel(ref.watch(_authRepository),
      ref.watch(_userRepository), ref.read(errorStateProvider));
});
