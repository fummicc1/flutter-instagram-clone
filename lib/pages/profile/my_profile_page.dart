import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/grid_post_model.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:flutter_instagram/ui_components/grid_timeline_card_widget.dart';
import 'package:flutter_instagram/ui_components/profile_status_widget.dart';
import 'package:flutter_instagram/ui_components/story_highlight_widget.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';
import 'package:flutter_instagram/viewmodels/profile_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(myProfileStateProvider.notifier);
    final state = ref.watch(myProfileStateProvider);
    final user = state.user;

    if (user == null) {
      viewModel.setup();
      return CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user.userID),
      ),
      body: ListView(
        children: [
          ProfileStatusWidget(
              user: user,
              hasNewStory: state.hasNewStory,
              avatarSize: state.avatarSize,
              isMyAccount: state.isMyAccount),
          ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.storyHighlightsList.length,
              itemBuilder: (context, index) {
                final story = state.storyHighlightsList[index];
                return StoryHighlightWidget(model: story);
              }),
          GridView.count(
            crossAxisCount: 3,
            children: state.posts
                .map((model) => GridTimelineCardWidget(
                    gridPostModel: model, onSelect: () {}))
                .toList(),
          )
        ],
      ),
    );
  }
}
