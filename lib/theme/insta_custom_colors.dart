import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

enum InstaColorTargets { inputBackground }

class InstaCustomColors extends CustomColors<InstaColorTargets> {
  InstaCustomColors()
      : super({
          InstaColorTargets.inputBackground: const SwitchableColor(
              light: Color(0xFFEEEEEE), dark: Color(0xFF212121))
        });
}
