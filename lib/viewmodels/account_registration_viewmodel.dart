import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/entities/user.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/account_registration_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRegistrationViewModel
    extends StateNotifier<AccountRegistrationState> {
  IAuthRepository _authRepository;
  IUserRepository _userRepository;
  StateNotifier<String?> _myUserIdStateNotifier;
  StateNotifier<GenericException?> _errorStateNotifier;
  AccountRegistrationViewModel(this._authRepository, this._userRepository,
      this._myUserIdStateNotifier, this._errorStateNotifier)
      : super(AccountRegistrationState());

  void updateEmail(String newValue) {
    state = state.copyWith(email: newValue);
  }

  void updatePassword(String newValue) {
    state = state.copyWith(password: newValue);
  }

  void updateUserName(String newValue) {
    state = state.copyWith(userName: newValue);
  }

  void updateUserId(String newValue) {
    state = state.copyWith(userId: newValue);
  }

  Future<bool> onClickNextButton() async {
    try {
      await _validateEmail();
      await _signUp();
      return true;
    } on GenericException catch (e) {
      _errorStateNotifier.state = e;
      return false;
    } catch (e) {
      _errorStateNotifier.state = SimpleException(e.toString());
      return false;
    }
  }

  Future<bool> onClickRegisterButton() async {
    try {
      await _registerUser();
      _myUserIdStateNotifier.state = state.userId;
      return true;
    } on GenericException catch (e) {
      _errorStateNotifier.state = e;
      return false;
    } catch (e) {
      _errorStateNotifier.state = SimpleException(e.toString());
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

  Future _registerUser() async {
    final id = _authRepository.getCurrentUserId()!;
    await _userRepository.create(UserEntity(
        id: id,
        displayName: state.userName,
        userId: state.userId,
        bio: null,
        profileImageReference: null));
  }
}
