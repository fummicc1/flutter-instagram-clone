import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';
import 'package:video_player/video_player.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key, required this.story}) : super(key: key);

  final Story story;

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    Story story = widget.story;
    if (story.videoModel.isLocal) {
      _videoPlayerController =
          VideoPlayerController.asset(story.videoModel.resource);
    } else {
      _videoPlayerController =
          VideoPlayerController.network(story.videoModel.resource);
    }
    _videoPlayerController.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
          tag: widget.story.userName,
          child: Material(
            color: Colors.black,
            child: Stack(
              children: [
                Center(
                    child: AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController))),
                Positioned(
                    top: 64,
                    left: 24,
                    height: 48,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        UserImageWidget(widget.story.userImage,
                            size: Size(32, 32), hasNewStory: true,),
                        SizedBox(width: 8),
                        Text(
                          widget.story.userName,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                Positioned(
                    top: 64,
                    height: 48,
                    right: 24,
                    child: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop()))
              ],
            ),
          ),
        ));
  }
}
