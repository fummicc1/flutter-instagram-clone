import 'dart:async';

import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';

class FakeAuthRepository implements IAuthRepository {
  final _users = [
    _FakeAuthUserData("FAKE_USER_0", "fake@fastriver.dev", "fake"),
  ];
  _FakeAuthUserData? _currentUser;
  int _uidCounter = 0;
  final StreamController<String?> _userIdStreamController = StreamController();

  FakeAuthRepository() {
    _uidCounter = _users.length;
  }

  void dispose() {
    _userIdStreamController.close();
  }

  @override
  Future<bool> isLoggedIn() async => _currentUser != null;

  @override
  String? getCurrentUserId() => _currentUser?.uid;

  @override
  Stream<String?> get userIdStream => _userIdStreamController.stream;

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    if (_users.indexWhere((u) => u.email == email) >= 0) {
      throw AuthException("User already exists");
    }
    final newUid = "FAKE_USER_${_uidCounter++}";
    final newUser = _FakeAuthUserData(newUid, email, password);
    _currentUser = newUser;
    _users.add(newUser);
    _userIdStreamController.sink.add(newUid);
    return newUid;
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    final match =
        _users.indexWhere((u) => u.email == email && u.password == password);
    if (match < 0) throw AuthException("User not found");
    _userIdStreamController.sink.add(_users[match].uid);
    return _users[match].uid;
  }

  @override
  Future signOut() async {
    _currentUser = null;
    _userIdStreamController.sink.add(null);
  }
}

class _FakeAuthUserData {
  final String uid;
  final String email;
  final String password;
  _FakeAuthUserData(this.uid, this.email, this.password);
}
