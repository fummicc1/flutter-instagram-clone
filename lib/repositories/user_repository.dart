import 'package:flutter_instagram/entities/user.dart';

abstract class IUserRepository {
  Future save();
  Future<UserEntity> findWithID(String userID);
}
