import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRegistrationViewModel
    extends StateNotifier<AccountRegistrationState> {
  IUserRepository _userRepository;
  late StreamController<Exception> errorStream;
  AccountRegistrationViewModel(this._userRepository)
      : super(AccountRegistrationState()) {
    errorStream = StreamController();
  }

  @override
  void dispose() {
    super.dispose();
    errorStream.close();
  }

  Future<bool> onClickNextButton() async {
    try {
      await _validateEmail();
      await _signUp();
      return true;
    } on EmailInputException catch (e) {
      errorStream.sink.add(e);
      return false;
    } catch (e) {
      errorStream.sink.add(SimpleException());
      return false;
    }
  }

  Future _validateEmail() async {
    if (!EmailValidator.validate(state.email)) {
      return Future.error(EmailInputException());
    }
  }

  Future _signUp() async {
    // TODO: implement
  }
}

class EmailInputException implements Exception {
  String message;
  EmailInputException([this.message = ""]);
}

class SimpleException implements Exception {}
