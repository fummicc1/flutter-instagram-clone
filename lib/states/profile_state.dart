import 'package:flutter/cupertino.dart';
import 'package:flutter_instagram/models/grid_post_model.dart';
import 'package:flutter_instagram/models/post.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/models/story_highlights_model.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState(
      {

      /// 投稿データ
      @Default([]) List<GridPostModel> posts,

      /// プロフィールデータ
      UserModel? user,

      /// プロフィールのBIO欄に表示されるストーリーズ
      @Default([]) List<StoryHighlightsModel> storyHighlightsList,

      /// 新規ストーリがあるか
      @Default(false) bool hasNewStory,

      /// アバターのImageの大きさ
      @Default(Size(96, 96)) avatarSize,

      /// `user`が自分のアカウントであるかどうか
      @Default(false) bool isMyAccount}) = _ProfileState;
}
