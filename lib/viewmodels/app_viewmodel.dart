import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppViewModel {
  final IAuthRepository _authRepository;
  final StateNotifier<GenericException?> _errorStateNotifier;
  AppViewModel(this._authRepository, this._errorStateNotifier);
  Future<bool> logout() async {
    try {
      await _authRepository.signOut();
      return true;
    } on GenericException catch (e) {
      _errorStateNotifier.state = e;
      return false;
    } catch (e) {
      _errorStateNotifier.state = SimpleException("$e");
      return false;
    }
  }
}
