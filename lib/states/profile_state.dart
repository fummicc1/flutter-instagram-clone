import 'package:flutter_instagram/models/post.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default([]) List<PostModel> posts,
    UserModel? user,
    @Default([]) List<StoryModel> highlightedStories,
    @Default(false) bool hasStory
}) = _ProfileState;
}