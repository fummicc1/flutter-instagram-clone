import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/home/home_page.dart';
import 'package:flutter_instagram/pages/profile/my_profile_page.dart';
import 'package:flutter_instagram/pages/reel/reel_page.dart';
import 'package:flutter_instagram/pages/search/search_page.dart';
import 'package:flutter_instagram/pages/shop/shop_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AfterLoginPage extends ConsumerWidget {
  const AfterLoginPage({Key? key}) : super(key: key);

  static const List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const ReelPage(),
    const ShopPage(),
    const MyProfilePage()
  ];

  @override
  Widget build(context, ref) {
    final appViewModel = ref.watch(appViewModelProvider);
    final userId = ref.watch(myProfileUserIdStateProvider).state;
    final selectedIndex = ref.watch(selectedBottomNavigationIndex).state;
    return Scaffold(
      appBar: AppBar(
        title: Text("AfterLoginPage"),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.house), label: ""), // ホーム
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""), // 検索
          BottomNavigationBarItem(
              icon: Icon(Icons.slow_motion_video), label: ""), // リール
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: ""), // バッグ
          // TODO: Use user own icon
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: ""), // プロフィール
        ],
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(selectedBottomNavigationIndex).state = index;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.no_accounts),
        label: Text("サインアウトする (userID: $userId)"),
        onPressed: () async {
          final res = await appViewModel.logout();
          if (res) {
            print("ログアウトしたと思う");
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (_) => AccountRegistrationStartPage()));
          }
        },
      ),
    );
  }
}
