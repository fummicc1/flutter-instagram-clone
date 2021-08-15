import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';

class FakeAuthRepository implements IAuthRepository {
  final users = [
    _FakeAuthUserData("FAKE_USER_0", "fake@fastriver.dev", "fake"),
  ];
  _FakeAuthUserData? currentUser;
  int uidCounter = 0;

  FakeAuthRepository() {
    uidCounter = users.length;
  }

  @override
  Future<bool> isLoggedIn() async => currentUser != null;

  @override
  String? getCurrentUserId() => currentUser?.uid;

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    final newUid = "FAKE_USER_${uidCounter++}";
    final newUser = _FakeAuthUserData(newUid, email, password);
    currentUser = newUser;
    users.add(newUser);
    return newUid;
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    final match =
        users.indexWhere((u) => u.email == email && u.password == password);
    if (match < 0) throw AuthException();
    return users[match].uid;
  }

  @override
  Future signOut() async {
    currentUser = null;
  }
}

class _FakeAuthUserData {
  final String uid;
  final String email;
  final String password;
  _FakeAuthUserData(this.uid, this.email, this.password);
}
