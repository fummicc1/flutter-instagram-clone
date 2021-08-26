import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_registration_state.freezed.dart';

@freezed
class AccountRegistrationState with _$AccountRegistrationState {
  const factory AccountRegistrationState({
    // String phoneNumber,
    @Default("") String email,
    @Default("") String password,
    @Default("") String userName,
    @Default("") String userId,
    // int selectedIndex,
    // String? facebookUserName,
  }) = _AccountRegistrationState;
}
