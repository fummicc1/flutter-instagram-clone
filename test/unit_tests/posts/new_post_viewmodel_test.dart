import 'dart:io';

import 'package:flutter_instagram/states/new_post_state.dart';
import 'package:flutter_instagram/viewmodels/post/new_post_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../services/fake_photo_service.dart';

void main() {

  late NewPostViewModel viewModel;
  late FakePhotoService photoService;

  setUp(() {
    const initialState = NewPostState();
    photoService = FakePhotoService(canGrant: false);
    viewModel = NewPostViewModel(initialState, photoService);
  });

  test("Can Update ImageFile", () async {
    final file = File("");
    viewModel.updateImageFile(file);
    expect(file, viewModel.state.imageFile);
  });

  test("Can fetch photo", () async {
    photoService.canGrant = true;
    await viewModel.fetchNewPhotos();
    expect(photoService.fetchPhotoIsCalled, true);
  });

  test("Cannot fetch photo", () async {
    photoService.canGrant = false;
    await viewModel.fetchNewPhotos();
    expect(photoService.fetchPhotoIsCalled, false);
  });
}