import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/timeline_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(
        settings: const RouteSettings(name: "/timeline"),
        fullscreenDialog: true,
        builder: (context) => TimelinePage())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          height: size.width * 0.25,
          width: size.width * 0.25,
          child: Image(image: AssetImage("assets/images/instagram_icon.png")),
        ),
      ),
    );
  }
}
