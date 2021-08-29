import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/repositories/query.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import './query_test.dart';

class FakeUserRepository implements IUserRepository {
  Map<String, UserEntity> userData = {
    "FAKE_USER_0": UserEntity(
        id: "FAKE_USER_0",
        userId: "fake_user_fast",
        displayName: "Fake KCSちゃん",
        bio: null,
        profileImageReference: null)
  };

  @override
  Future create(UserEntity userEntity) async {
    userData[userEntity.id] = userEntity;
  }

  @override
  Future update({required String id, required UserEntity newEntity}) async {
    userData[id] = newEntity;
  }

  @override
  Future<UserEntity?> findWithID(String userID) async {
    final equalQueryModel =
        EqualQueryModel(fieldName: "user_id", fieldValue: userID);
    final copyData = userData;

    for (final entity in copyData.values) {
      if (equalQueryModel.validate(entity.data)) copyData.remove(entity);
    }

    return copyData.values.first;
  }

  @override
  Future<String?> uidToUserId(String uid) async {
    final data = userData[uid];
    return data?.userId;
  }
}
