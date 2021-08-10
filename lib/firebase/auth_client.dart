import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  final FirebaseAuth _firebaseAuth;

  final StreamController<User?> _userStreamController = StreamController();

  AuthClient(this._firebaseAuth) {
    final stream = _firebaseAuth.authStateChanges();
    _userStreamController.addStream(stream);
  }

  /// Stream which is sent whenever authUser has updated
  Stream<User?> get userStream => _userStreamController.stream;

  /// Current User's ID
  String? get currentUserId => _firebaseAuth.currentUser?.uid;

  /// Log in with Email and Password
  Future<User?> logInWithEmail(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  /// Create Account with Email and Password
  Future<User?> signUpWithEmail(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  /// SignOut
  Future signOut() => _firebaseAuth.signOut();

  /// Delete
  Future delete() =>
      _firebaseAuth.currentUser?.delete() ?? Future.error("No Current User");
}
