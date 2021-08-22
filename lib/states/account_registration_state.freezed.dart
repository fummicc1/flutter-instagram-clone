// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'account_registration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountRegistrationStateTearOff {
  const _$AccountRegistrationStateTearOff();

  _AccountRegistrationState call({String email = "", String password = ""}) {
    return _AccountRegistrationState(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $AccountRegistrationState = _$AccountRegistrationStateTearOff();

/// @nodoc
mixin _$AccountRegistrationState {
// String phoneNumber,
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountRegistrationStateCopyWith<AccountRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountRegistrationStateCopyWith<$Res> {
  factory $AccountRegistrationStateCopyWith(AccountRegistrationState value,
          $Res Function(AccountRegistrationState) then) =
      _$AccountRegistrationStateCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$AccountRegistrationStateCopyWithImpl<$Res>
    implements $AccountRegistrationStateCopyWith<$Res> {
  _$AccountRegistrationStateCopyWithImpl(this._value, this._then);

  final AccountRegistrationState _value;
  // ignore: unused_field
  final $Res Function(AccountRegistrationState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AccountRegistrationStateCopyWith<$Res>
    implements $AccountRegistrationStateCopyWith<$Res> {
  factory _$AccountRegistrationStateCopyWith(_AccountRegistrationState value,
          $Res Function(_AccountRegistrationState) then) =
      __$AccountRegistrationStateCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$AccountRegistrationStateCopyWithImpl<$Res>
    extends _$AccountRegistrationStateCopyWithImpl<$Res>
    implements _$AccountRegistrationStateCopyWith<$Res> {
  __$AccountRegistrationStateCopyWithImpl(_AccountRegistrationState _value,
      $Res Function(_AccountRegistrationState) _then)
      : super(_value, (v) => _then(v as _AccountRegistrationState));

  @override
  _AccountRegistrationState get _value =>
      super._value as _AccountRegistrationState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_AccountRegistrationState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountRegistrationState implements _AccountRegistrationState {
  const _$_AccountRegistrationState({this.email = "", this.password = ""});

  @JsonKey(defaultValue: "")
  @override // String phoneNumber,
  final String email;
  @JsonKey(defaultValue: "")
  @override
  final String password;

  @override
  String toString() {
    return 'AccountRegistrationState(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountRegistrationState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$AccountRegistrationStateCopyWith<_AccountRegistrationState> get copyWith =>
      __$AccountRegistrationStateCopyWithImpl<_AccountRegistrationState>(
          this, _$identity);
}

abstract class _AccountRegistrationState implements AccountRegistrationState {
  const factory _AccountRegistrationState({String email, String password}) =
      _$_AccountRegistrationState;

  @override // String phoneNumber,
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccountRegistrationStateCopyWith<_AccountRegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}
