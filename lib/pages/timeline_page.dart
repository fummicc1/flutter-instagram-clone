import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/models/video_model.dart';
import 'package:flutter_instagram/ui_components/blacked_icon.dart';
import 'package:flutter_instagram/ui_components/story_widget.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<Story> stories = [
    Story(
        userImage: ImageModel(isLocal: false, resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName1",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: ImageModel(isLocal: false, resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName2",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: ImageModel(isLocal: false, resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName3",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: ImageModel(isLocal: false, resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName4",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: ImageModel(isLocal: false, resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName5",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: null,
        userName: "userName6",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: null,
        userName: "userName7",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: null,
        userName: "userName8",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: null,
        userName: "userName9",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: null,
        userName: "userName10",
        videoModel: VideoModel(isLocal: false, resource: "")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Instagram", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              icon: BlackedIcon(Icons.add_box_outlined), onPressed: null),
          IconButton(icon: BlackedIcon(Icons.favorite), onPressed: null),
          IconButton(
              icon: BlackedIcon(
                Icons.chat,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final Story story = stories[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        child: StoryWidget(story: story),
                      );
                    }),
              )
            )
          ],
        ),
      ),
    );
  }
}
