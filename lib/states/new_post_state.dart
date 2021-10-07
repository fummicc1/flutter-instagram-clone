import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_post_state.freezed.dart';

@freezed
class NewPostState with _$NewPostState {
  const factory NewPostState(
      {File? imageFile,
      String? albumName,
      @Default([]) List<File> photos}) = _NewPostState;
}
