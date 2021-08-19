import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRegistrationViewModel
    extends StateNotifier<AccountRegistrationState> {
  IAuthRepository _authRepository;
  late StreamController<Exception> errorStream;
  AccountRegistrationViewModel(this._authRepository)
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
    } on Messagable catch (e) {
      errorStream.sink.add(SimpleException(e.message()));
      return false;
    } catch (e) {
      errorStream.sink.add(SimpleException(e.toString()));
      return false;
    }
  }

  Future _validateEmail() async {
    if (!EmailValidator.validate(state.email)) {
      return Future.error(EmailInputException());
    }
  }

  Future _signUp() async {
    var uid = await _authRepository.signUp(
        email: state.email, password: state.password);
    state = state.copyWith(uid: uid);
  }
}
