import 'package:flutter/material.dart';

import 'package:flutter_instagram/pages/root_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final MaterialColor materialWhite = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: materialWhite,
            accentColor: Colors.black,
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: Colors.black)),
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(primary: Colors.black)),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                unselectedItemColor: Colors.black.withAlpha(120),
                selectedItemColor: Colors.black)),
        darkTheme: ThemeData.dark(),
        home: const RootPage());
  }
}
