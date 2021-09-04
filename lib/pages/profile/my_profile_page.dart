import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/grid_post_model.dart';
import 'package:flutter_instagram/models/story_highlights_model.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:flutter_instagram/ui_components/grid_timeline_card_widget.dart';
import 'package:flutter_instagram/ui_components/profile_status_widget.dart';
import 'package:flutter_instagram/ui_components/profile_story_list_widget.dart';
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
      return Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        ProfileStatusWidget(
            user: user,
            hasNewStory: state.hasNewStory,
            avatarSize: state.avatarSize,
            isMyAccount: state.isMyAccount),
        SizedBox(
          height: 16,
        ),
        _buildStoryHighlighView(context, state.storyHighlightsList),
        Container(
          height: 56,
          child: Row(
            children: [
              Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.apps_rounded))),
              Expanded(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.list))),
              Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.person_pin_rounded))),
            ],
          ),
        ),
        Flexible(
          child: GridView.count(
            crossAxisCount: 3,
            children: state.posts
                .map((model) => GridTimelineCardWidget(
                    gridPostModel: model, onSelect: () {}))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _buildStoryHighlighView(
      BuildContext context, List<StoryHighlightsModel> stories) {
    if (stories.isEmpty) {
      return SizedBox.shrink();
    }
    return Container(
        height: 96, child: ProfileStoryListWidget(storyHighlightList: stories));
  }
}
