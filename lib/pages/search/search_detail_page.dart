import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchDetailPage extends HookConsumerWidget {
  const SearchDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(searchViewModelProvider.notifier);
    final state = ref.watch(searchViewModelProvider);
    final tabController = useTabController(initialLength: 5);
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Expanded(
            child: TextField(),
          )
        ]),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.menu),
            ),
            Tab(
              icon: Icon(Icons.menu),
            ),
            Tab(
              icon: Icon(Icons.menu),
            ),
            Tab(
              icon: Icon(Icons.menu),
            ),
            Tab(
              icon: Icon(Icons.menu),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.deepPurple,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }
}
