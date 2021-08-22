import 'package:flutter_instagram/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState extends _$ProfileState {
  const factory ProfileState({
    @Default([]) List<PostModel> posts
}) = _ProfileState;
}