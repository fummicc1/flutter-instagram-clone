import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/pages/account_registration_name_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountRegistrationSignUpPage extends ConsumerWidget {
  const AccountRegistrationSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(accountRegistrationViewModelProvider.notifier);
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: [
                  const Text("電話番号またはメールアドレスを入力"),
                  const TabBar(
                    tabs: [
                      Tab(
                        text: "電話番号",
                      ),
                      Tab(
                        text: "メール",
                      )
                    ],
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 48,
                    child: TextField(
                      onChanged: (value) => viewModel.updateEmail(value),
                      decoration: const InputDecoration(
                          hintText: "メールアドレス",
                          filled: true,
                          fillColor: Color(0xFFFAFAFA),
                          contentPadding: EdgeInsets.only(
                              left: 8, right: 8, bottom: 48 / 2),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFEDEDED))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFEDEDED)))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 48,
                    child: TextField(
                      onChanged: (value) => viewModel.updatePassword(value),
                      decoration: const InputDecoration(
                          hintText: "パスワード",
                          filled: true,
                          fillColor: Color(0xFFFAFAFA),
                          contentPadding: EdgeInsets.only(
                              left: 8, right: 8, bottom: 48 / 2),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFEDEDED))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFEDEDED)))),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final res = await viewModel.onClickNextButton();
                            if (res) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      const AccountRegistrationNamePage()));
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text("次へ"),
                          ),
                          style: ElevatedButton.styleFrom(elevation: 0),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 36,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36),
                        child: Text("または"),
                      ),
                      Flexible(
                          child: Container(
                        height: 1,
                        color: Colors.grey,
                      )),
                    ],
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Text("f"),
                      label: const Text(
                        "Facebookでログイン",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
