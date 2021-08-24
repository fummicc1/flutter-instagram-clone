import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';

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

class ProfileStatusWidget extends StatelessWidget {
  ProfileStatusWidget(
      {Key? key,
      required this.user,
      required this.hasNewStory,
      required this.avatarSize,
      required this.isMyAccount})
      : super(key: key);

  final UserModel user;
  final bool hasNewStory;
  final Size avatarSize;
  final bool isMyAccount;

  Widget buildProfileWidget(BuildContext buildContext) {
    final numericStat = _ProfileNumericStatusModel(
        postCount: user.posts.length,
        followerCount: user.followerCount,
        followeeCount: user.followeeCount);

    return Column(
      children: [
        Row(
          children: [
            UserImageWidget(user.avatar,
                hasNewStory: hasNewStory, size: avatarSize),
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
        Text(user.displayName ?? user.userID),
        Text(user.bio ?? "")
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
  Widget build(BuildContext context) {
    return buildProfileWidget(context);
  }
}
