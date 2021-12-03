import 'package:flutter/material.dart';

class ColoredText extends StatelessWidget {
  const ColoredText(
      {Key? key,
      required this.text,
      required this.color,
      this.style = const TextStyle()})
      : super(key: key);

  final TextStyle style;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(color: color),
    );
  }

  factory ColoredText.backgroundColor(BuildContext context, String text,
      {TextStyle style = const TextStyle()}) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    return ColoredText(
      text: text,
      color: color,
      style: style,
    );
  }
}
