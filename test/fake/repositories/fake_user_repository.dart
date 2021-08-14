import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';

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
    final user = userData[userID];
    return user;
  }
}
