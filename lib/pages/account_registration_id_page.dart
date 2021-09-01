import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/pages/after_login_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRegistrationIdPage extends ConsumerWidget {
  const AccountRegistrationIdPage({Key? key}) : super(key: key);

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
                        "ユーザーネームを変更",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Text(
                      "アカウントのユーザーネームを選択してください。ユーザーネームはいつでも変更できます。",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 48,
                      child: TextField(
                        onChanged: (value) => viewModel.updateUserId(value),
                        decoration: InputDecoration(
                            hintText: "user_id",
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
                            onPressed: state.userId.isNotEmpty
                                ? () async {
                                    final res =
                                        await viewModel.onClickRegisterButton();
                                    if (res) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  AfterLoginPage()));
                                    }
                                  }
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text("完了",
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
