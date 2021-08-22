import 'package:flutter/cupertino.dart';
import 'package:flutter_instagram/models/image_model.dart';

@immutable
class UserModel {
  /// UserID（ユーザーが設定できる）
  final String userID;

  /// 自分の表示名
  final String? displayName;

  /// 概要
  final String? bio;

  /// プロフィール写真
  final ImageModel? avatar;

  UserModel(
      {required this.userID,
      required this.displayName,
      required this.bio,
      required this.avatar});
}
