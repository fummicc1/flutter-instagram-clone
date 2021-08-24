import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/repositories/query.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import './query_test.dart';

class FakeUserRepository implements IUserRepository {
  Map<String, UserEntity> userData = {};

  @override
  Future create(UserEntity userEntity) async {
    userData[userEntity.id] = userEntity;
  }

  @override
  Future update({required String id, required UserEntity newEntity}) async {
    userData[id] = newEntity;
  }

  Future<UserEntity?> findWithID(String userID) async {
    final equalQueryModel = EqualQueryModel(fieldName: "user_id", fieldValue: userID);
    final copyData = userData;

    for (final entity in copyData.values) {
      if (equalQueryModel.validate(entity.data)) copyData.remove(entity);
    }

    return copyData.values.first;
  }
}
