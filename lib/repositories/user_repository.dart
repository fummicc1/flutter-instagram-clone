import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';

abstract class IUserRepository {
  Future save(UserEntity user);

  Future<UserEntity?> findWithID(String userID);
}

class UserRepository implements IUserRepository {
  final FirestoreClient _firestoreClient;

  UserRepository(this._firestoreClient);

  @override
  Future save(UserEntity user) async {
    final previous = await findWithID(user.id);
    if (previous.isEmpty) {
      return _firestoreClient.createDoc(
          collectionName: UserEntity.collectionName, data: user.data);
    }
    return _firestoreClient.updateDocWithPath(
        collection: UserEntity.collectionName,
        documentId: user.id,
        data: user.data);
  }

  @override
  Future<UserEntity?> findWithID(String userID) async {
    final Map<String, dynamic> data = await _firestoreClient
        .getDoc(collectionName: UserEntity.collectionName, documentName: userID)
        .catchError((_) => Map<String, dynamic>());
    try {
      final UserEntity userEntity = UserEntity.fromData(data);
      return userEntity;
    } on UserEntityParseException catch (e) {
      return Future.error(e);
    }
  }
}
