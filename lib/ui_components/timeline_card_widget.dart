import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/post.dart';
import 'package:flutter_instagram/ui_components/blacked_icon.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';

class TimelineCardWidget extends StatelessWidget {
  final PostModel post;

  TimelineCardWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 32,
              child: Stack(
                children: [
                  Row(children: [
                    UserImageWidget(
                        imageModel: post.userImage,
                        size: Size(32, 32),
                        hasNewStory: false),
                    SizedBox(width: 8),
                    Text(post.userID),
                  ]),
                  Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: null,
                      ))
                ],
              ),
            ),
          ),
          buildPostImage(post),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(post.message),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                BlackedIcon(Icons.favorite_border),
                SizedBox(
                  width: 8,
                ),
                BlackedIcon(Icons.message),
                SizedBox(
                  width: 8,
                ),
                BlackedIcon(Icons.share_rounded)
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TODO: 複数の画像を表示する
  Image buildPostImage(PostModel post) {
    if (post.postImageList.first != null) {
      return Image.network(post.postImageList.first.resource);
    } else {
      throw UnimplementedError();
    }
  }
}
