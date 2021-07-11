import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/post.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/models/video_model.dart';
import 'package:flutter_instagram/pages/add_post_page.dart';
import 'package:flutter_instagram/pages/story_page.dart';
import 'package:flutter_instagram/ui_components/blacked_icon.dart';
import 'package:flutter_instagram/ui_components/open_leftward_page_transition_builder.dart';
import 'package:flutter_instagram/ui_components/story_widget.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<Story> stories = [
    Story(
        userImage: ImageModel(
            isLocal: false,
            resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName1",
        videoModel: VideoModel(
            isLocal: false,
            resource:
                "https://storage.coverr.co/videos/wHJw800jYeIq6DhsKggFE4ZpFwE8hO9bT?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjI1NjUyMjg0fQ.dblW5m6wOWPiOuKHEhBBFIZRedkIE1i-xncdDcSjCxY")),
    Story(
        userImage: null,
        userName: "userName2",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: ImageModel(
            isLocal: false,
            resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName3",
        videoModel: VideoModel(
            isLocal: false,
            resource:
                "https://storage.coverr.co/videos/wBbE5poq85nPL77gy1U3cbSWbLd7pd1q?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjI1NjUyMjg0fQ.dblW5m6wOWPiOuKHEhBBFIZRedkIE1i-xncdDcSjCxY")),
    Story(
        userImage: null,
        userName: "userName4",
        videoModel: VideoModel(isLocal: false, resource: "")),
    Story(
        userImage: ImageModel(
            isLocal: false,
            resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        userName: "userName5",
        videoModel: VideoModel(
            isLocal: false,
            resource:
                "https://storage.coverr.co/videos/wBbE5poq85nPL77gy1U3cbSWbLd7pd1q?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBJZCI6Ijg3NjdFMzIzRjlGQzEzN0E4QTAyIiwiaWF0IjoxNjI1NjUyMjg0fQ.dblW5m6wOWPiOuKHEhBBFIZRedkIE1i-xncdDcSjCxY")),
  ];

  List<Post> posts = [
    Post(
        userName: "userName1",
        userImage: ImageModel(
            isLocal: false,
            resource: "https://avatars.githubusercontent.com/u/44002126?v=4"),
        postImage: ImageModel(
            isLocal: false,
            resource:
                "https://cdn.pixabay.com/photo/2021/07/01/21/20/girl-6380331_1280.jpg"),
        message: "UserName1 created a new post!",
        likeCount: 0,
        isFavorite: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Post(
        userName: "userName2",
        userImage: ImageModel(
            isLocal: true, resource: "assets/images/instagram_icon.png"),
        postImage: ImageModel(
            isLocal: false,
            resource:
                "https://cdn.pixabay.com/photo/2021/06/02/20/56/antelope-canyon-6305458_1280.jpg"),
        message: "UserName2 created a new post!",
        likeCount: 0,
        isFavorite: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
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
              icon: BlackedIcon(Icons.add_box_outlined),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => AddPostPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return OpenLeftwardPageTransitionBuilder()
                          .buildTransitions(
                              MaterialPageRoute(
                                  builder: (context) => AddPostPage()),
                              context,
                              animation,
                              secondaryAnimation,
                              child);
                    }));
              }),
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
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    final Story story = stories[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: StoryWidget(
                          story: story,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StoryPage(story: story)));
                          }),
                    );
                  }),
            ),
            Flexible(
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      Post post = posts[index];
                      return Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 32,
                                child: Stack(
                                  children: [
                                    Row(children: [
                                      UserImageWidget(post.userImage,
                                          size: Size(32, 32),
                                          hasNewStory: false),
                                      SizedBox(width: 8),
                                      Text(post.userName),
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
                    }))
          ],
        ),
      ),
    );
  }

  Image buildPostImage(Post post) {
    if (post.postImage.isLocal) {
      return Image(
        image: AssetImage(post.postImage.resource),
      );
    } else {
      return Image.network(post.postImage.resource);
    }
  }
}
