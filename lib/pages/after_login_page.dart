import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/account_registration_start_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfterLoginPage extends ConsumerWidget {
  const AfterLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final appViewModel = ref.watch(appViewModelProvider);
    final userId = ref.watch(myProfileUserIdStateProvider).state;
    return Scaffold(
      appBar: AppBar(
        title: Text("AfterLoginPage"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(onPressed: null, child: Text("Posts")),
            TextButton(onPressed: null, child: Text("Search")),
            TextButton(onPressed: null, child: Text("Stories")),
            TextButton(onPressed: null, child: Text("Shop")),
            TextButton(onPressed: null, child: Text("Profile")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("My userId is $userId"),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await appViewModel.logout();
                if (res) {
                  print("ログアウトしたと思う");
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (_) => AccountRegistrationStartPage()));
                }
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
