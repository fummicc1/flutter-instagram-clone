import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/account_registration_name_page.dart';

class AccountRegistrationSignUpPage extends StatelessWidget {
  const AccountRegistrationSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: [
                  Text("電話番号またはメールアドレスを入力"),
                  TabBar(
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
                    margin: EdgeInsets.symmetric(vertical: 16),
                    height: 48,
                    child: TextField(
                      decoration: InputDecoration(
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
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => AccountRegistrationNamePage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
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
      ),
    );
  }
}
