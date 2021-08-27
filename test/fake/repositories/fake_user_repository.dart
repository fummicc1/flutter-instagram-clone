import 'dart:async';

import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/repositories/query.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import './query_test.dart';

class FakeUserRepository implements IUserRepository {
  Map<String, UserEntity> userData = {};

  final StreamController<UserEntity?> _me = StreamController();

  @override
  Future create(UserEntity userEntity) async {
    userData[userEntity.id] = userEntity;
  }

  @override
  Future update({required String id, required UserEntity newEntity}) async {
    userData[id] = newEntity;
  }

  Future<UserEntity?> findWithID(String userID) async {
    final equalQueryModel =
        EqualQueryModel(fieldName: "user_id", fieldValue: userID);
    return userData.values
        .where((entity) => equalQueryModel.validate(entity.data))
        .first;
  }

  @override
  Stream<UserEntity?> onChangeMe() => _me.stream;

  @override
  Future setMe(UserEntity? userEntity) async => _me.add(userEntity);

  @override
  Future<UserEntity?> findWithAuthID(String uid) async {
    final query = EqualQueryModel(fieldName: "id", fieldValue: uid);
    return userData.values.where((entity) => query.validate(entity.data)).first;
  }
}
