import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthClient {
  /// Stream which is sent whenever authUser has updated
  Stream<User?> get userStream;

  /// Current User's ID
  String? get currentUserId;

  /// Log in with Email and Password
  Future<User?> logInWithEmail(
      {required String email, required String password});

  /// Create Account with Email and Password
  Future<User?> signUpWithEmail(
      {required String email, required String password});

  /// SignOut
  Future signOut();

  /// Delete
  Future delete();
}

class AuthClient implements IAuthClient {
  final FirebaseAuth _firebaseAuth;

  final StreamController<User?> _userStreamController = StreamController();

  AuthClient(this._firebaseAuth) {
    final stream = _firebaseAuth.authStateChanges();
    _userStreamController.addStream(stream);
  }

  /// Stream which is sent whenever authUser has updated
  @override
  Stream<User?> get userStream => _userStreamController.stream;

  /// Current User's ID
  @override
  String? get currentUserId => _firebaseAuth.currentUser?.uid;

  /// Log in with Email and Password
  @override
  Future<User?> logInWithEmail(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  /// Create Account with Email and Password
  @override
  Future<User?> signUpWithEmail(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  /// SignOut
  @override
  Future signOut() => _firebaseAuth.signOut();

  /// Delete
  @override
  Future delete() =>
      _firebaseAuth.currentUser?.delete() ?? Future.error("No Current User");
}
