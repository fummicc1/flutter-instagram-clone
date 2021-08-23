import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/firebase/auth_client.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// flow errors from ViewModels.
final errorStateProvider = StateProvider<GenericException?>((_) => null);

final authClient = Provider((_) => AuthClient(FirebaseAuth.instance));

final authRepository = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(authClient));
});

final accountRegistrationViewModel = StateNotifierProvider<
    AccountRegistrationViewModel, AccountRegistrationState>((ref) {
  // return AccountRegistrationViewModel(ref.watch(authRepository), ref.read);
  return AccountRegistrationViewModel(
      ref.watch(authRepository), ref.read(errorStateProvider));
});
