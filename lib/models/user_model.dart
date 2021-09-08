import 'package:flutter/cupertino.dart';
import 'package:flutter_instagram/models/grid_post_model.dart';
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
  final ImageModel avatar;

  /// フォロワー数
  final int followerCount;

  /// フォローしている数
  final int followeeCount;

  /// 投稿
  final List<GridPostModel> posts;

  UserModel(
      {required this.userID,
        required this.displayName,
        required this.bio,
        required this.avatar,
        required this.posts,
        required this.followerCount,
        required this.followeeCount});
}
