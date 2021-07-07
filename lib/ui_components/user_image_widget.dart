import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/image_model.dart';

class UserImageWidget extends StatelessWidget {

  final ImageModel? imageModel;
  final Size size;

  UserImageWidget(this.imageModel, { required this.size});

  @override
  Widget build(BuildContext context) {

    final ImageProvider image;
    if (imageModel != null) {
      if (imageModel!.isLocal) {
        image = AssetImage(imageModel!.resource);
      } else {
        image = NetworkImage(imageModel!.resource);
      }
    } else {
      image = AssetImage("assets/images/instagram_icon.png");
    }

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFFFD1D1D),
          width: 2
        )
      ),
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: image
            ),
          border: Border.all(
            color: Colors.white,
            width: 2
          )
        ),
      ),
    );
  }

}