import 'package:flutter_instagram/entities/user.dart';

enum UserRepositoryError { AlreadyExistsUserID }

abstract class IUserRepository {
  Future save(UserEntity user);
  Future<UserEntity?> findWithID(String userID);
}
