import 'package:flutter_instagram/models/post.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState(
      {

      /// 投稿データ
      @Default([]) List<PostModel> posts,

      /// プロフィールデータ
      UserModel? user,

      /// プロフィールのBIO欄に表示されるストーリーズ
      @Default([]) List<StoryModel> highlightedStories,

      /// 新規ストーリがあるか
      @Default(false) bool hasNewStory}) = _ProfileState;
}
