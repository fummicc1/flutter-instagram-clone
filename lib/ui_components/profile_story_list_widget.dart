import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/models/story_highlights_model.dart';
import 'package:flutter_instagram/ui_components/story_highlight_widget.dart';
import 'package:flutter_instagram/ui_components/story_widget.dart';

class ProfileStoryListWidget extends StatelessWidget {
  ProfileStoryListWidget({Key? key, required this.storyHighlightList})
      : super(key: key);

  final List<StoryHighlightsModel> storyHighlightList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyHighlightList.length,
        itemBuilder: (context, index) {
          final story = storyHighlightList[index];
          return StoryHighlightWidget(model: story);
        });
  }
}
