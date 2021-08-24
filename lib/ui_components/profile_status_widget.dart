import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';
import 'package:flutter_instagram/viewmodels/profile_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// プロフィールに表示する数字データをまとめたクラス
class _ProfileNumericStatusModel {
  final int followerCount;
  final int followeeCount;
  final int postCount;

  _ProfileNumericStatusModel(
      {required this.postCount,
      required this.followerCount,
      required this.followeeCount});
}

class ProfileStatusWidget extends ConsumerWidget {
  const ProfileStatusWidget({Key? key, required}) : super(key: key);

  Future<Widget> buildProfileWidget(
      BuildContext buildContext, WidgetRef ref) async {

    final state = ref.watch(myProfileStateProvider);

    final numericStat = _ProfileNumericStatusModel(
        postCount: state.userModel?.posts.length,
        followerCount: userModel.followerCount,
        followeeCount: userModel.followeeCount);

    return Column(
      children: [
        Row(
          children: [
            UserImageWidget(userModel.avatar,
                hasNewStory: hasNewStory, size: imageSize),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    profileNumberStackWidget(
                        buildContext: buildContext,
                        number: numericStat.postCount,
                        label: "posts"),
                    profileNumberStackWidget(
                        buildContext: buildContext,
                        number: numericStat.followerCount,
                        label: "followers"),
                    profileNumberStackWidget(
                        buildContext: buildContext,
                        number: numericStat.followeeCount,
                        label: "followings"),
                  ],
                ),
                Row(children: profileActionLists(buildContext))
              ],
            )
          ],
        ),
        SizedBox(height: 8),
        Text(userModel.displayName ?? userModel.userID),
        Text(userModel.bio ?? "")
      ],
    );
  }

  List<Widget> profileActionLists(BuildContext buildContext) {
    if (isMyAccount) {
      return [];
    }
    return [
      TextButton(onPressed: () {}, child: Text("Message")),
      TextButton(
          onPressed: () {},
          child: Row(
            children: [Icon(Icons.check), Icon(Icons.person)],
          )),
      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down_rounded))
    ];
  }

  Widget profileNumberStackWidget(
      {required BuildContext buildContext,
      required int number,
      required String label}) {
    return Column(
      children: [
        Text(number.toString(),
            style: Theme.of(buildContext).textTheme.headline4),
        Text(label, style: Theme.of(buildContext).textTheme.bodyText2)
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
