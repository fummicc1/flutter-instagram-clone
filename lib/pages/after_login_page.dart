import 'package:flutter/material.dart';

class AfterLoginPage extends StatelessWidget {
  const AfterLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AfterLoginPage"),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(onPressed: null, child: Text("Posts")),
            TextButton(onPressed: null, child: Text("Search")),
            TextButton(onPressed: null, child: Text("Stories")),
            TextButton(onPressed: null, child: Text("Shop")),
            TextButton(onPressed: null, child: Text("Profile")),
          ],
        ),
      ),
    );
  }
}
