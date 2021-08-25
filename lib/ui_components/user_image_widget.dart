import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/image_model.dart';

class UserImageWidget extends StatelessWidget {
  final ImageModel imageModel;
  final bool hasNewStory;
  final Size size;

  UserImageWidget(
      {required this.imageModel,
      required this.hasNewStory,
      required this.size});

  @override
  Widget build(BuildContext context) {
    final ImageProvider image = NetworkImage(imageModel.resource);

    if (hasNewStory == false) {
      return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: image),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFFD1D1D), width: 2)),
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: image),
            border: Border.all(color: Colors.white, width: 2)),
      ),
    );
  }
}
