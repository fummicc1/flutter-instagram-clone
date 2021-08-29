import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/account_registration_sign_up_page.dart';
import 'package:flutter_instagram/pages/after_login_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(loginViewModelProvider.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 2.8,
                        child: SvgPicture.asset(
                          "assets/images/Instagram_logo.svg",
                          color: Colors.black,
                          semanticsLabel: "Instagram Logo",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 48,
                        child: TextField(
                          onChanged: (value) => viewModel.updateEmail(value),
                          decoration: InputDecoration(
                              hintText: "メールアドレス",
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 48 / 2),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEDEDED))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEDEDED)))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: 48,
                        child: TextField(
                          onChanged: (value) => viewModel.updatePassword(value),
                          decoration: InputDecoration(
                              hintText: "パスワード",
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              contentPadding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 48 / 2),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEDEDED))),
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
                                final res =
                                    await viewModel.onClickLoginButton();
                                if (res) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => AfterLoginPage()));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text("ログイン"),
                              ),
                              style: ElevatedButton.styleFrom(elevation: 0),
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(text: "ログイン情報を忘れた場合は、"),
                          TextSpan(
                              text: "ログインに関するヘルプ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(text: "をご確認ください。")
                        ]),
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Container(
                            height: 1,
                            color: Colors.grey,
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
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
                          icon: Text("f"),
                          label: Text(
                            "Facebookでログイン",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                color: Colors.grey,
                height: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "アカウントを持っていない場合は、"),
                    TextSpan(
                        text: "登録",
                        style: TextStyle(color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) =>
                                    AccountRegistrationSignUpPage()));
                          }),
                    TextSpan(text: "してください。")
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
