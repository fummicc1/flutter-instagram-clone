import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_instagram/pages/home/timeline_page.dart';
import 'package:flutter_instagram/pages/post/new_post_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: 1);

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [NewPostPage(pageController: pageController,), const TimelinePage()],
      ),
    );
  }
}
