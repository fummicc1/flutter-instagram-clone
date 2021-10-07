import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramLogoWidget extends StatelessWidget {
  const InstagramLogoWidget({Key? key, this.width, this.height})
      : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/Instagram_logo.svg",
      color: Colors.black,
      width: width,
      height: height,
      semanticsLabel: "Instagram Logo",
    );
  }
}
