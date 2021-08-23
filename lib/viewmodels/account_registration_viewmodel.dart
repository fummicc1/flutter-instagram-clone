import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRegistrationViewModel
    extends StateNotifier<AccountRegistrationState> {
  IAuthRepository _authRepository;
  StateNotifier<GenericException?> errorStateNotifier;
  AccountRegistrationViewModel(this._authRepository, this.errorStateNotifier)
      : super(AccountRegistrationState());
  // final Reader read;
  // AccountRegistrationViewModel(this._authRepository, this.read)
  //     : super(AccountRegistrationState());

  @override
  void dispose() {
    print("DISPOSE: AccountRegistrationViewModel");

    super.dispose();
  }

  void updateEmail(String newValue) {
    print("new email: $newValue");
    state = state.copyWith(email: newValue);
  }

  void updatePassword(String newValue) {
    print("new password: $newValue");
    state = state.copyWith(password: newValue);
  }

  Future<bool> onClickNextButton() async {
    print("onClickNext: ${state.email} ${state.password}");
    try {
      await _validateEmail();
      await _signUp();
      return true;
    } on GenericException catch (e) {
      print("onClickNext End: ${state.email} ${state.password}");
      errorStateNotifier.state = e;
      //errorStateNotifier.state = e;
      print("onClickNext End: ${state.email} ${state.password}");
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
