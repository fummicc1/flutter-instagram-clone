import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

enum AppColor {
  background,
  accent,
  nonColoredBackground,
  nonColoredAccent,
  reverseBackground,
  reverseAccent
}

class AppCustomColors extends CustomColors {
  AppCustomColors() : super({
    AppColor.background: const SwitchableColor(light: Colors.white, dark: Colors.black),
    AppColor.accent: const SwitchableColor(light: Colors.blue, dark: Colors.blue),
    AppColor.nonColoredBackground: const SwitchableColor(light: Colors.white, dark: Colors.black),
    AppColor.nonColoredAccent: const SwitchableColor(light: Colors.black, dark: Colors.white),
    AppColor.reverseBackground: const SwitchableColor(light: Colors.black, dark: Colors.white),
    AppColor.reverseAccent: const SwitchableColor(light: Colors.white, dark: Colors.black),
  })
}