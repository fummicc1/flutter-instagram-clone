import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_new_post_info_state.freezed.dart';

@freezed
class AddNewPostInfoState with _$AddNewPostInfoState {
  const factory AddNewPostInfoState({
    @Default("") String caption,
    @Default("New Post") String appBarTitle,
    File? imageFile,
  }) = _AddNewPostInfoState;
}
