import 'package:flutter/material.dart';
import 'package:flutter_instagram/pages/after_login_page.dart';
import 'package:flutter_instagram/pages/login/login_page.dart';
import 'package:flutter_instagram/pages/root_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:flutter_instagram/viewmodels/app_viewmodel.dart';
import 'package:flutter_instagram/viewmodels/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../fake/repositories/fake_auth_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

void main() {
  testWidgets("Login", (tester) async {
    // set up page
    // viewModelにref.readを渡す必要があるためparentを用意
    // overrideは初期化時に行うためcontainerは渡せない
    final parent = ProviderContainer();
    final container = ProviderContainer(parent: parent, overrides: [
      loginViewModelProvider.overrideWithProvider(StateNotifierProvider((ref) {
        return LoginViewModel(
            FakeAuthRepository(), FakeUserRepository(), parent.read);
      })),
      // どこかで生成されてしまうものはモックにしないと死ぬ
      myProfileUserIdStateProvider
          .overrideWithProvider(StateProvider<String?>((_) => null)),
      appViewModelProvider.overrideWithProvider(Provider((ref) {
        return AppViewModel(FakeAuthRepository(), parent.read);
      })),
    ]);
    addTearDown(container.dispose);
    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: TestApp(),
    ));

    // 入力の確認
    await tester.enterText(find.byType(TextField).first, "fake@fastriver.dev");
    expect(container.read(loginViewModelProvider).email, "fake@fastriver.dev");
    await tester.enterText(find.byType(TextField).last, "fake");
    expect(container.read(loginViewModelProvider).password, "fake");

    await tester.tap(find.text("ログイン"));
    await tester.pumpAndSettle();
    expect(find.byType(RootPage), findsOneWidget);
  });
}
