import 'package:flutter_instagram/viewmodels/profile_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/repositories/fake_image_repository.dart';
import '../../fake/repositories/fake_post_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';

void main() {
  ProfileViewModel profileViewModel;
  FakeUserRepository fakeUserRepo;
  FakePostRepository fakePostRepo;
  FakeImageRepository fakeImageRepo;

  setUp() {
    fakeUserRepo = FakeUserRepository();
    fakePostRepo = FakePostRepository();
    fakeImageRepo = FakeImageRepository();
    final userID = "fummicc1";
    profileViewModel = ProfileViewModel(
        fakeUserRepo, fakePostRepo, fakeImageRepo,
        userID: userID);
  }

  test("Succeed to setup", () async {
    await profileViewModel.setup();
  });

  test("Fail to setup", () async {

  })
}
