import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/video_model.dart';

class StoryModel {
  final ImageModel? userImage;
  final String userName;
  final VideoModel videoModel;
  final DateTime createdAt;

  StoryModel({required this.userImage, required this.userName, required this.createdAt, required this.videoModel});
}