import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountRegistrationPage extends StatelessWidget {
  const AccountRegistrationPage({Key? key}) : super(key: key);

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
                        Spacer(
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
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    Text("登録して友達の写真や動画をチェックしよう"),
                    Container(
                      height: 150,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Text("f"),
                            label: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
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
                    TextButton(
                        onPressed: () {},
                        child: Text(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("すでにアカウントをお持ちの場合"),
                TextButton(
                  onPressed: null,
                  child: Text("ログイン"),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
