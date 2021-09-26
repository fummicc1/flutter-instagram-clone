import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/account_registration_sign_up_page.dart';
import 'package:flutter_instagram/pages/root_page.dart';
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 72,
                      ),
                      AspectRatio(
                        aspectRatio: 2.8,
                        child: SvgPicture.asset(
                          "assets/images/Instagram_logo.svg",
                          color: Colors.black,
                          semanticsLabel: "Instagram Logo",
                        ),
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
                                  borderSide:
                                      BorderSide(color: Color(0xFFEDEDED))),
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
                          obscureText: true,
                          decoration: const InputDecoration(
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
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => const RootPage()));
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text("ログイン"),
                              ),
                              style: ElevatedButton.styleFrom(elevation: 0),
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(children: const [
                          TextSpan(text: "ログイン情報を忘れた場合は、"),
                          TextSpan(
                              text: "ログインに関するヘルプ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: "をご確認ください。")
                        ], style: Theme.of(context).textTheme.caption),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                color: Colors.grey,
                height: 1,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(text: "アカウントを持っていない場合は、"),
                  TextSpan(
                      text: "登録",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const AccountRegistrationSignUpPage()));
                        }),
                  const TextSpan(text: "してください。")
                ], style: Theme.of(context).textTheme.caption),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
