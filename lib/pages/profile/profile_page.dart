import 'package:flutter/material.dart';
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:flutter_instagram/ui_components/user_image_widget.dart';
import 'package:flutter_instagram/viewmodels/profile_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
    );
  }
}
