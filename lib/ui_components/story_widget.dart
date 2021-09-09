import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;
  final VoidCallback? onPressed;

  const StoryWidget({Key? key, required this.story, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: [
            Hero(
                tag: story.userID,
                child: Material(
                    child: UserImageWidget(
                  imageModel: story.userImage,
                  size: Size(56, 56),
                  hasNewStory: true,
                ))),
            SizedBox(
              height: 4,
            ),
            Text(story.userID)
          ],
        ),
      ),
    );
  }
}
