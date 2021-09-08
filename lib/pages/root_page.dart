import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/pages/account_registration_start_page.dart';
import 'package:flutter_instagram/pages/after_login_page.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_instagram/utils/show_toast.dart';

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<StateController<GenericException?>>(errorStateProvider,
        (controller) {
      final exception = controller.state;
      if (exception != null && exception is GenericException) {
        final message = exception.message();
        showToast(context, message: message);
      }
    });

    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Container(); // something went wrong
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(); // Not complete initializing Firebase
          }
          final needToLogin = ref.watch(needToLoginProvider);
          return needToLogin.when(
              loading: () => Container(),
              error: (err, stack) => Container(),
              data: (needToLogin) => needToLogin
                  ? const AccountRegistrationStartPage()
                  : const AfterLoginPage());
        });
  }
}
