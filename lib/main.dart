import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

import 'package:flutter_instagram/pages/root_page.dart';
import 'package:flutter_instagram/theme/insta_custom_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
  RenderPositionedBox
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FastThemeScope(
      accentColor: Colors.blue,
      themeMode: ThemeMode.light,
      customColors: InstaCustomColors(),
      builder: (context, lightTheme, darkTheme, mode) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: mode,
            home: const RootPage());
      },
    );
  }
}
