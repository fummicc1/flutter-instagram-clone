import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/account_registration_sign_up_page.dart';
import 'package:flutter_instagram/pages/login/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountRegistrationStartPage extends StatelessWidget {
  const AccountRegistrationStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Flexible(
                          flex: 4,
                          child: AspectRatio(
                            aspectRatio: 2.8,
                            child: SvgPicture.asset(
                              "assets/images/Instagram_logo.svg",
                              color: Colors.black,
                              semanticsLabel: "Instagram Logo",
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    const Text("登録して友達の写真や動画をチェックしよう"),
                    Container(
                      height: 150,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Text("f"),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text("Facebookでログイン"),
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
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  const AccountRegistrationSignUpPage()));
                        },
                        child: const Text(
                          "電話番号またはメールアドレスで登録",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
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
                  TextSpan(text: "すでにアカウントをお持ちの場合は、"),
                  TextSpan(
                      text: "ログイン",
                      style: TextStyle(color: Colors.black),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        }),
                  TextSpan(text: "してください。")
                ]),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
