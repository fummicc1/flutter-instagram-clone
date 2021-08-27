import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/firebase/auth_client.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';
import 'package:flutter_instagram/repositories/query.dart';

abstract class IAuthRepository {
  Future<bool> isLoggedIn();
  String? getCurrentUserId();
  abstract final Stream<String?> uIdStream;

  /// return the current uid if the authentication succeeded
  Future<String> signUp({required String email, required String password});
  Future<String> signIn({required String email, required String password});
  Future signOut();

  Future<String?> uidToUserId(String uid);
}

class AuthRepository implements IAuthRepository {
  final IAuthClient _authClient;
  final IFirestoreClient _firestoreClient;
  AuthRepository(this._authClient, this._firestoreClient);

  @override
  Future<bool> isLoggedIn() async =>
      (await _authClient.userStream.last) != null;

  @override
  String? getCurrentUserId() => _authClient.currentUserId;

  @override
  Stream<String?> get uIdStream => _authClient.userStream
          .transform(StreamTransformer.fromHandlers(handleData: (data, sink) {
        sink.add(data?.uid);
      }));

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    final user =
        await _authClient.signUpWithEmail(email: email, password: password);
    if (user != null) {
      return user.uid;
    }
    throw AuthException("Sign up failed");
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    final user =
        await _authClient.logInWithEmail(email: email, password: password);
    if (user != null) {
      return user.uid;
    }
    throw AuthException("Sign in failed");
  }

  @override
  Future signOut() async {
    await _authClient.signOut();
  }

  @override
  Future<String?> uidToUserId(String uid) async {
    final query = EqualQueryModel(fieldName: "id", fieldValue: uid);
    final baseReference =
        FirebaseFirestore.instance.collection(UserEntity.collectionName);
    final List<Map<String, dynamic>> data = await _firestoreClient
        .getWithQuery(query.build(baseReference))
        .catchError((_) => [Map<String, dynamic>()]);
    try {
      final UserEntity userEntity = UserEntity.fromData(data.first);
      return userEntity.userId;
    } on EntityParserException catch (e) {
      return Future.error(e);
    }
  }
}
