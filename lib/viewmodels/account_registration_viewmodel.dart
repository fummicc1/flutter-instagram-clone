import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRegistrationViewModel
    extends StateNotifier<AccountRegistrationState> {
  IAuthRepository _authRepository;
  StateNotifier<GenericException?> errorStateNotifier;
  AccountRegistrationViewModel(this._authRepository, this.errorStateNotifier)
      : super(AccountRegistrationState());

  void updateEmail(String newValue) {
    state = state.copyWith(email: newValue);
  }

  void updatePassword(String newValue) {
    state = state.copyWith(password: newValue);
  }

  Future<bool> onClickNextButton() async {
    try {
      await _validateEmail();
      await _signUp();
      return true;
    } on GenericException catch (e) {
      errorStateNotifier.state = e;
      return false;
    } catch (e) {
      errorStateNotifier.state = SimpleException(e.toString());
      return false;
    }
  }

  Future _validateEmail() async {
    if (!EmailValidator.validate(state.email)) {
      throw EmailInputException();
    }
  }

  Future _signUp() async {
    await _authRepository.signUp(email: state.email, password: state.password);
  }
}
