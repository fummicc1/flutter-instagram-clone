import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  bool isLoggedIn();
  Future<User> signUp({required String email, required String password});
  Future<User> signIn({required String email, required String password});
  Future signOut();
}
