// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  _SearchState call(
      {String searchingText = "",
      Loadable<List<UserModel>> userSearchResult =
          const Loadable(const <UserModel>[])}) {
    return _SearchState(
      searchingText: searchingText,
      userSearchResult: userSearchResult,
    );
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  /// 検索テキスト
  String get searchingText => throw _privateConstructorUsedError;

  /// ユーザ検索結果
  Loadable<List<UserModel>> get userSearchResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call({String searchingText, Loadable<List<UserModel>> userSearchResult});

  $LoadableCopyWith<List<UserModel>, $Res> get userSearchResult;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? searchingText = freezed,
    Object? userSearchResult = freezed,
  }) {
    return _then(_value.copyWith(
      searchingText: searchingText == freezed
          ? _value.searchingText
          : searchingText // ignore: cast_nullable_to_non_nullable
              as String,
      userSearchResult: userSearchResult == freezed
          ? _value.userSearchResult
          : userSearchResult // ignore: cast_nullable_to_non_nullable
              as Loadable<List<UserModel>>,
    ));
  }

  @override
  $LoadableCopyWith<List<UserModel>, $Res> get userSearchResult {
    return $LoadableCopyWith<List<UserModel>, $Res>(_value.userSearchResult,
        (value) {
      return _then(_value.copyWith(userSearchResult: value));
    });
  }
}

/// @nodoc
abstract class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) then) =
      __$SearchStateCopyWithImpl<$Res>;
  @override
  $Res call({String searchingText, Loadable<List<UserModel>> userSearchResult});

  @override
  $LoadableCopyWith<List<UserModel>, $Res> get userSearchResult;
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(
      _SearchState _value, $Res Function(_SearchState) _then)
      : super(_value, (v) => _then(v as _SearchState));

  @override
  _SearchState get _value => super._value as _SearchState;

  @override
  $Res call({
    Object? searchingText = freezed,
    Object? userSearchResult = freezed,
  }) {
    return _then(_SearchState(
      searchingText: searchingText == freezed
          ? _value.searchingText
          : searchingText // ignore: cast_nullable_to_non_nullable
              as String,
      userSearchResult: userSearchResult == freezed
          ? _value.userSearchResult
          : userSearchResult // ignore: cast_nullable_to_non_nullable
              as Loadable<List<UserModel>>,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.searchingText = "",
      this.userSearchResult = const Loadable(const <UserModel>[])});

  @JsonKey(defaultValue: "")
  @override

  /// 検索テキスト
  final String searchingText;
  @JsonKey(defaultValue: const Loadable(const <UserModel>[]))
  @override

  /// ユーザ検索結果
  final Loadable<List<UserModel>> userSearchResult;

  @override
  String toString() {
    return 'SearchState(searchingText: $searchingText, userSearchResult: $userSearchResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchState &&
            (identical(other.searchingText, searchingText) ||
                const DeepCollectionEquality()
                    .equals(other.searchingText, searchingText)) &&
            (identical(other.userSearchResult, userSearchResult) ||
                const DeepCollectionEquality()
                    .equals(other.userSearchResult, userSearchResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchingText) ^
      const DeepCollectionEquality().hash(userSearchResult);

  @JsonKey(ignore: true)
  @override
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {String searchingText,
      Loadable<List<UserModel>> userSearchResult}) = _$_SearchState;

  @override

  /// 検索テキスト
  String get searchingText => throw _privateConstructorUsedError;
  @override

  /// ユーザ検索結果
  Loadable<List<UserModel>> get userSearchResult =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
