import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/account_registration_id_page.dart';
import 'package:flutter_instagram/pages/account_registration_start_page.dart';
import 'package:flutter_instagram/pages/after_login_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final MaterialColor materialWhite = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: materialWhite,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.black)
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(primary: Colors.black)
          )
        ),
        darkTheme: ThemeData.dark(),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Container(); // something went wrong
            if (snapshot.connectionState == ConnectionState.done)
              return Consumer(
                builder: (context, ref, child) {
                  final needToLogin = ref.watch(needToLoginProvider);
                  return needToLogin.when(
                      loading: () => Container(),
                      error: (err, stack) => Container(),
                      data: (value) => value
                          ? AccountRegistrationStartPage()
                          : AfterLoginPage());
                },
              ); // complete
            return Container(); // loading
          },
        ));
  }
}
