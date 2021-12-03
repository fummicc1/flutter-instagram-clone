import 'package:flutter/material.dart';
import 'package:flutter_instagram/ui_components/instagram_logo_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const InstagramLogoWidget(
          height: 56,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
        ],
      ),
      body: Container(),
    );
  }
}
