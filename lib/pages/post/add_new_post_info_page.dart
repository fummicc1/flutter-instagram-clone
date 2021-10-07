import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddNewPostInfoPage extends HookConsumerWidget {
  const AddNewPostInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(addNewPostInfoStateProvider.notifier);
    final state = ref.watch(addNewPostInfoStateProvider);
    final captionTextController = useTextEditingController(text: state.caption);

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
        actions: [
          TextButton(
              onPressed: () async {
                await viewModel.submit();
                Navigator.of(context).popUntil((route) {
                  // Rootまで戻る
                  return route.settings.name == "/";
                });
              },
              child: const Text("Share"))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.keyboard_arrow_left_outlined)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: Image.file(state.imageFile!),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: TextField(
                    controller: captionTextController,
                    onChanged: (newValue) {
                      viewModel.updateCaption(newValue);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
