import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/video_model.dart';

class StoryModel {
  /// ユーザーの画像
  final ImageModel userImage;
  /// ユーザID
  final String userID;
  /// 動画データ
  final VideoModel videoModel;
  /// ストーリーを投稿してから経過した時間
  final String passedTime;

  StoryModel(
      {required this.userImage,
      required this.userID,
      required this.passedTime,
      required this.videoModel});
}
