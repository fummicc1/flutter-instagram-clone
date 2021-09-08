import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
  const ProfileStatusWidget(
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

  Widget _buildProfileWidget(BuildContext context) {
    final numericStat = _ProfileNumericStatusModel(
        postCount: user.posts.length,
        followerCount: user.followerCount,
        followeeCount: user.followeeCount);

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                child: UserImageWidget(
                    imageModel: user.avatar,
                    hasNewStory: hasNewStory,
                    size: avatarSize),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: profileNumberStackWidget(
                              context: context,
                              number: numericStat.postCount,
                              label: "posts"),
                        ),
                        Flexible(
                          child: profileNumberStackWidget(
                              context: context,
                              number: numericStat.followerCount,
                              label: "followers"),
                        ),
                        Flexible(
                          child: profileNumberStackWidget(
                              context: context,
                              number: numericStat.followeeCount,
                              label: "followings"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                user.displayName ?? user.userID,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.apply(fontWeightDelta: 2),
              ),
              Text(user.bio ?? "",
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 32,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: profileActionLists(context)),
          )
        ],
      ),
    );
  }

  List<Widget> profileActionLists(BuildContext context) {
    return [
      Expanded(
        child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(primary: Colors.black),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "フォロー中",
                ),
                Icon(Icons.arrow_drop_down_outlined)
              ],
            )),
      ),
      const SizedBox(
        width: 8,
      ),
      Expanded(
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(primary: Colors.black),
              onPressed: () {},
              child: const Text("メッセージ"))),
      const SizedBox(
        width: 8,
      ),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border:
                Border.all(width: 1, color: Theme.of(context).dividerColor)),
        width: 28,
        child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.arrow_drop_down_rounded,
            )),
      )
    ];
  }

  Widget profileNumberStackWidget(
      {required BuildContext context,
      required int number,
      required String label}) {
    return Column(
      children: [
        Text(number.toString(), style: Theme.of(context).textTheme.headline6),
        Text(label, style: Theme.of(context).textTheme.bodyText2)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildProfileWidget(context);
  }
}
