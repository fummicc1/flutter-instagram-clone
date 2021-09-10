import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/story.dart';

@immutable
class StoryHighlightsModel {
  final List<StoryModel> stories;
  final String title;

  StoryHighlightsModel({required this.title, required this.stories});
}
