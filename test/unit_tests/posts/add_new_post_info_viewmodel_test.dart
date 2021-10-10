import 'dart:io';

import 'package:flutter_instagram/states/add_new_post_info_state.dart';
import 'package:flutter_instagram/viewmodels/post/add_new_post_info_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/repositories/fake_auth_repository.dart';
import '../../fake/repositories/fake_image_repository.dart';
import '../../fake/repositories/fake_post_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';

void main() {
  late AddNewPostInfoViewModel viewModel;
  late ProviderContainer providerContainer;

  setUp(() {
    const initialState = AddNewPostInfoState();
    providerContainer = ProviderContainer();
    viewModel = AddNewPostInfoViewModel(
      initialState,
      FakePostRepository(),
      FakeUserRepository(),
      FakeAuthRepository(isAlreadyLoggedIn: true),
      FakeImageRepository(),
      providerContainer.read,
    );
  });

  test("Can Update Caption", () {
    const caption = "ふみっち";
    viewModel.updateCaption(caption);
    expect(viewModel.state.caption, caption);
  });

  test("Can submit with Image", () async {
    final stubImageFile = File("");
    const stubCaption = "テストキャプション";
    viewModel.state = viewModel.state.copyWith(
      caption: stubCaption,
      imageFile: stubImageFile,
    );
    final isSuccess = await viewModel.submit();
    expect(isSuccess, true);
  });

  test("Can submit without Image", () async {
    const stubCaption = "テストキャプション";
    viewModel.state = viewModel.state.copyWith(
      caption: stubCaption,
    );
    await viewModel.submit();
    final isSuccess = await viewModel.submit();
    expect(isSuccess, true);
  });

  test("Can fail to submit with empty Caption", () async {
    const stubCaption = "";
    viewModel.state = viewModel.state.copyWith(
      caption: stubCaption,
    );
    await viewModel.submit();
    final isSuccess = await viewModel.submit();
    expect(isSuccess, false);
  });
}
