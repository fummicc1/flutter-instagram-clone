import 'dart:io';

import 'package:flutter_instagram/services/photo_service.dart';
import 'package:flutter_instagram/states/new_post_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPostViewModel extends StateNotifier<NewPostState> {
  NewPostViewModel(NewPostState state, this._photoService) : super(state) {
    fetchNewPhotos();
  }

  final IPhotoService _photoService;

  int _currentPhotoPage = 1;

  fetchNewPhotos() async {
    final granted = await _photoService.requestAuthorization();
    if (!granted) return;
    _photoService.fetchPhotos(page: _currentPhotoPage).listen((file) {
      state = state.copyWith(photos: state.photos + [file]);
    });
    _currentPhotoPage += 1;
  }

  updateImageFile(File file) {
    state = state.copyWith(imageFile: file);
  }
}
