import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';

class FakeUserRepository implements IUserRepository {
  Map<String, UserEntity> userData = {};

  @override
  Future save(UserEntity user) async {
    if (userData.keys.contains(user.id)) {
      return Future.error(UserRepositoryError.AlreadyExistsUserID);
    }
    userData[user.id] = user;
  }

  Future<UserEntity?> findWithID(String userID) async {
    final user = userData[userID];
    return user;
  }
}
