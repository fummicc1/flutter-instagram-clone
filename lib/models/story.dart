import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/video_model.dart';

class Story {
  final ImageModel? userImage;
  final String userName;
  final VideoModel videoModel;

  Story({required this.userImage, required this.userName, required this.videoModel});
}