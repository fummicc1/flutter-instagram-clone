import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';
import 'package:flutter_instagram/repositories/query.dart';

abstract class IUserRepository {
  Future create(UserEntity userEntity);

  Future update({required String id, required UserEntity newEntity});

  Future<UserEntity?> findWithID(String userID);

  Future<String?> uidToUserId(String uid);
}

class UserRepository implements IUserRepository {
  final IFirestoreClient _firestoreClient;

  UserRepository(this._firestoreClient);

  @override
  Future create(UserEntity userEntity) async {
    return _firestoreClient.createDoc(
        collectionName: UserEntity.collectionName, data: userEntity.data);
  }

  @override
  Future update({required String id, required UserEntity newEntity}) {
    return _firestoreClient.updateDocWithPath(
        collection: UserEntity.collectionName,
        documentId: id,
        data: newEntity.data);
  }

  @override
  Future<UserEntity?> findWithID(String userID) async {
    final query = EqualQueryModel(fieldName: "user_id", fieldValue: userID);
    final baseReference =
        FirebaseFirestore.instance.collection(UserEntity.collectionName);
    final List<Map<String, dynamic>> data = await _firestoreClient
        .getWithQuery(query.build(baseReference))
        .catchError((_) => [Map<String, dynamic>()]);
    try {
      final UserEntity userEntity = UserEntity.fromData(data.first);
      return userEntity;
    } on EntityParserException catch (e) {
      return Future.error(e);
    }
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
