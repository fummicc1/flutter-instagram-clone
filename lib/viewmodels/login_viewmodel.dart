import 'package:email_validator/email_validator.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;
  final Reader _read;
  LoginViewModel(this._authRepository, this._userRepository, this._read)
      : super(const LoginState());

  void updateEmail(String newValue) {
    state = state.copyWith(email: newValue);
  }

  void updatePassword(String newValue) {
    state = state.copyWith(password: newValue);
  }

  Future<bool> onClickLoginButton() async {
    try {
      await _validateEmail();
      final userId = await _signIn();
      _read(myProfileUserIdStateProvider).state = userId;
      return true;
    } on GenericException catch (e) {
      _read(errorStateProvider).state = e;
      return false;
    } catch (e) {
      _read(errorStateProvider).state = SimpleException(e.toString());
      return false;
    }
  }

  Future _validateEmail() async {
    if (!EmailValidator.validate(state.email)) {
      throw EmailInputException();
    }
  }

  /// if succeeded to sign in, return userId.
  Future<String> _signIn() async {
    final uid = await _authRepository.signIn(
        email: state.email, password: state.password);
    final userId = await _userRepository.uidToUserId(uid);
    if (userId == null) throw UserException(uid: uid, code: 0);
    return userId;
  }
}
