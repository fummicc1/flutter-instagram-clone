import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';
import 'package:flutter_instagram/pages/post/add_new_post_info_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/ui_components/colored_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewPostPage extends HookConsumerWidget {
  const NewPostPage({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(newPostStateProvider.notifier);
    final state = ref.watch(newPostStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: ColoredText.backgroundColor(context, "New Post",
            style: Theme.of(context).textTheme.headline6!),
        backgroundColor: FastTheme.of(context).nonColoredAccent,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddNewPostInfoPage()));
              },
              child: const Text("Next"))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          onPressed: () async {
            await pageController.animateToPage(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: FastTheme.of(context).nonColoredAccent,
            height: MediaQuery.of(context).size.height * 0.3,
            child: _buildCurrentSelectingImageView(context, ref),
          ),
          Container(
            color: FastTheme.of(context).nonColoredAccent,
            child: Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                    label: ColoredText.backgroundColor(
                        context, state.albumName ?? "アルバムを選択")),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ],
            ),
          ),
          Flexible(
              child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent) {
                      viewModel.fetchNewPhotos();
                    }
                    return true;
                  },
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: state.photos.length,
                      itemBuilder: (context, index) {
                        final file = state.photos[index];
                        return Container(
                          color: FastTheme.of(context).nonColoredAccent,
                          child: GestureDetector(
                            child: Image.file(file),
                            onTap: () {
                              viewModel.updateImageFile(file);
                            },
                          ),
                        );
                      })))
        ],
      ),
    );
  }

  Widget _buildCurrentSelectingImageView(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newPostStateProvider);
    final isSelected = state.imageFile != null;
    final Widget view;
    if (isSelected) {
      view = Image.file(state.imageFile!);
    } else {
      view = Center(
          child: Text(
        "画像を選択",
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
      ));
    }
    return view;
  }
}
