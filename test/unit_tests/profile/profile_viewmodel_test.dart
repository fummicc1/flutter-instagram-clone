import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/viewmodels/profile_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/notifiers/fake_error_state_notifier.dart';
import '../../fake/repositories/fake_image_repository.dart';
import '../../fake/repositories/fake_post_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';

void main() {
  late ProfileViewModel profileViewModel;
  late FakeUserRepository fakeUserRepo;
  late FakePostRepository fakePostRepo;
  late FakeErrorStateNotifier fakeErrorStateNotifier;
  late FakeImageRepository fakeImageRepo;

  setUp(() {
    fakeUserRepo = FakeUserRepository();
    fakePostRepo = FakePostRepository();
    fakeImageRepo = FakeImageRepository();
    fakeErrorStateNotifier = FakeErrorStateNotifier();
    const userID = "fummicc1";
    profileViewModel = ProfileViewModel(
        fakeUserRepo,
        fakePostRepo,
        fakeImageRepo,
        fakeErrorStateNotifier,
        userID: userID);
  });

  test("Succeed to setup", () async {
    final UserEntity userEntity = UserEntity(
        id: "LXAuvBG9tAfZoUI6olWJP6w9JAF2",
        userId: "fummicc1",
        displayName: "ふみっち",
        bio: null,
        profileImageReference: null
    );
    await fakeUserRepo.create(userEntity);

    await profileViewModel.setup();

    final user = profileViewModel.state.user;

    expect(user, isNotNull);

    expect(user!.userID, equals("fummicc1"));
  });

  test("Fail to setup", () async {
    fakeUserRepo.userData.clear();

    await profileViewModel.setup();
    final user = profileViewModel.state.user;
    expect(user, isNull);
  });
}
