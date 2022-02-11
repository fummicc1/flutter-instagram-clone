import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';
import 'package:flutter_instagram/pages/search/search_detail_page.dart';
import 'package:flutter_instagram/theme/insta_custom_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const SearchDetailPage()
                  ));
                },
                child: Container(
                  height: 28,
                  decoration: BoxDecoration(
                      color: FastTheme.of(context)
                          .getCustomColor(InstaColorTargets.inputBackground),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.search),
                      ),
                      Text(
                        "検索",
                      )
                    ],
                  ),
                ),
              ),
            )),
            const IconButton(onPressed: null, icon: Icon(Icons.map_outlined))
          ],
        ),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: 21,
        itemBuilder: (BuildContext context, int index) => const Placeholder(),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(1, index % 7 == 0 ? 2 : 1),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
    );
  }
}
