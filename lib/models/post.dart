import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/image_model.dart';

@immutable
class PostModel {
  // 投稿ID
  final String id;
  // ユーザーID
  final String userID;
  final ImageModel userImage;

  final List<ImageModel> postImageList;
  // 投稿内容
  final String message;

  final int likeCount;
  // 自分がいいねを押したか
  final bool isFavorite;

  // Metadata
  final DateTime createdAt;
  final DateTime updatedAt;

  PostModel(
      {
        required this.id,
        required this.userID,
      required this.userImage,
      required this.postImageList,
      required this.message,
      required this.likeCount,
      required this.isFavorite,
      required this.createdAt,
      required this.updatedAt});
}
