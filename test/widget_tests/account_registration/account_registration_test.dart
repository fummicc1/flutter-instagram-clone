import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/account_registration/account_registration_id_page.dart';
import 'package:flutter_instagram/pages/account_registration/account_registration_name_page.dart';
import 'package:flutter_instagram/pages/account_registration/account_registration_sign_up_page.dart';
import 'package:flutter_instagram/pages/account_registration/account_registration_start_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../fake/repositories/fake_auth_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AccountRegistrationStartPage(),
    );
  }
}

void main() {
  testWidgets("Register account", (tester) async {
    // set up page
    // viewModelにref.readを渡す必要があるためparentを用意
    // overrideは初期化時に行うためcontainerは渡せない
    final parent = ProviderContainer();
    final container = ProviderContainer(parent: parent, overrides: [
      accountRegistrationViewModelProvider
          .overrideWithProvider(StateNotifierProvider((ref) {
        return AccountRegistrationViewModel(
            FakeAuthRepository(), FakeUserRepository(), parent.read);
      }))
    ]);
    addTearDown(container.dispose);
    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: const TestApp(),
    ));

    await tester.tap(find.text("電話番号またはメールアドレスで登録"));
    await tester.pumpAndSettle();

    // SignUpPageへの遷移を確認
    expect(find.byType(AccountRegistrationSignUpPage), findsOneWidget);

    // 入力の確認
    await tester.enterText(find.byType(TextField).first, "test@fastriver.dev");
    expect(container.read(accountRegistrationViewModelProvider).email,
        "test@fastriver.dev");
    await tester.enterText(find.byType(TextField).last, "password");
    expect(container.read(accountRegistrationViewModelProvider).password,
        "password");

    await tester.tap(find.text("次へ"));
    await tester.pumpAndSettle();
    expect(find.byType(AccountRegistrationNamePage), findsOneWidget);

    expect(
        tester
            .widget<ElevatedButton>(find.widgetWithText(ElevatedButton, "次へ"))
            .enabled,
        isFalse);
    await tester.enterText(find.byType(TextField), "KCSちゃん");
    expect(container.read(accountRegistrationViewModelProvider).userName,
        "KCSちゃん");
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<ElevatedButton>(find.widgetWithText(ElevatedButton, "次へ"))
            .enabled,
        isTrue);

    await tester.tap(find.text("次へ"));
    await tester.pumpAndSettle();
    expect(find.byType(AccountRegistrationIdPage), findsOneWidget);

    await tester.enterText(find.byType(TextField), "kcs_chan");
    expect(container.read(accountRegistrationViewModelProvider).userId,
        "kcs_chan");
  });
}
