import 'package:flutter_instagram/models/image_model.dart';

class Post {
  final String userName;
  final ImageModel? userImage;
  final ImageModel postImage;
  final String message;
  final int likeCount;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime updatedAt;

  Post(
      {required this.userName,
      required this.userImage,
      required this.postImage,
      required this.message,
      required this.likeCount,
      required this.isFavorite,
      required this.createdAt,
      required this.updatedAt});
}
