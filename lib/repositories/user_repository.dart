import 'package:flutter_instagram/entities/user.dart';

enum UserRepositoryError { AlreadyExistsUserID }

abstract class IUserRepository {
  Future create(UserEntity userEntity);
  Future update({ required String id, required UserEntity newEntity});
  Future<UserEntity?> findWithID(String userID);
}
