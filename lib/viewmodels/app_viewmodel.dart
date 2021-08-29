import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppViewModel {
  final IAuthRepository _authRepository;
  final Reader _read;
  AppViewModel(this._authRepository, this._read);
  Future<bool> logout() async {
    try {
      await _authRepository.signOut();
      return true;
    } on GenericException catch (e) {
      _read(errorStateProvider).state = e;
      return false;
    } catch (e) {
      _read(errorStateProvider).state = SimpleException("$e");
      return false;
    }
  }
}
