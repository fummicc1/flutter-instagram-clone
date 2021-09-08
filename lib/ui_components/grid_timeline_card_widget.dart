import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/grid_post_model.dart';

class GridTimelineCardWidget extends StatelessWidget {
  const GridTimelineCardWidget(
      {Key? key, required this.gridPostModel, required this.onSelect})
      : super(key: key);

  final GridPostModel gridPostModel;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Stack(
        children: [
          Image.network(gridPostModel.topImageURL),
          gridPostModel.hasMultipleImage
              ? const Positioned(
                  top: 0,
                  right: 0,
                  height: 16,
                  width: 16,
                  child: Icon(Icons.photo_library_outlined))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
