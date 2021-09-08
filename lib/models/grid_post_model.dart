import 'package:flutter/material.dart';

@immutable
class GridPostModel {
  final String postID;
  final String topImageURL;
  final bool hasMultipleImage;

  const GridPostModel(
      {required this.postID,
      required this.topImageURL,
      required this.hasMultipleImage});
}
