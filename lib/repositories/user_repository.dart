import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';

abstract class IUserRepository {
  Future create(UserEntity userEntity);

  Future update({required String id, required UserEntity newEntity});

  Future<UserEntity?> findWithID(String userID);
}

class UserRepository implements IUserRepository {
  final FirestoreClient _firestoreClient;

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
    final Map<String, dynamic> data = await _firestoreClient
        .getDoc(collectionName: UserEntity.collectionName, documentName: userID)
        .catchError((_) => Map<String, dynamic>());
    try {
      final UserEntity userEntity = UserEntity.fromData(data);
      return userEntity;
    } on EntityParserException catch (e) {
      return Future.error(e);
    }
  }
}
