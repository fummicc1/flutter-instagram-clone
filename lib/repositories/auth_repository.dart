import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/firebase/auth_client.dart';

abstract class IAuthRepository {
  Future<bool> isLoggedIn();
  String? getCurrentUserId();
  // return the current uid if the authentication succeeded
  Future<String> signUp({required String email, required String password});
  Future<String> signIn({required String email, required String password});
  Future signOut();
}

class AuthRepository implements IAuthRepository {
  final IAuthClient _authClient;
  AuthRepository(this._authClient);

  @override
  Future<bool> isLoggedIn() async =>
      (await _authClient.userStream.last) != null;

  @override
  String? getCurrentUserId() => _authClient.currentUserId;

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    final user =
        await _authClient.signUpWithEmail(email: email, password: password);
    if (user != null) {
      return user.uid;
    }
    throw AuthException();
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    final user =
        await _authClient.logInWithEmail(email: email, password: password);
    if (user != null) {
      return user.uid;
    }
    throw AuthException();
  }

  @override
  Future signOut() async {
    await _authClient.signOut();
  }
}
