import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/pages/account_registration_id_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRegistrationNamePage extends ConsumerWidget {
  const AccountRegistrationNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(accountRegistrationViewModelProvider.notifier);
    final state = ref.watch(accountRegistrationViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 48, right: 48, top: 48),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "名前を追加してください",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Text(
                      "名前を追加すると、友達に見つけてもらいやすくなります。",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 48,
                      child: TextField(
                        onChanged: (value) => viewModel.updateUserName(value),
                        decoration: InputDecoration(
                            hintText: "名前",
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
                            onPressed: state.userName.isNotEmpty
                                ? () async {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                AccountRegistrationIdPage()));
                                  }
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text("次へ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button!
                                      .copyWith(color: Colors.white)),
                            ),
                            style: ElevatedButton.styleFrom(elevation: 0),
                          ),
                        ),
                      ],
                    ),
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
