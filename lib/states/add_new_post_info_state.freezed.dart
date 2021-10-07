// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'add_new_post_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddNewPostInfoStateTearOff {
  const _$AddNewPostInfoStateTearOff();

  _AddNewPostInfoState call(
      {String caption = "", String appBarTitle = "New Post", File? imageFile}) {
    return _AddNewPostInfoState(
      caption: caption,
      appBarTitle: appBarTitle,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
const $AddNewPostInfoState = _$AddNewPostInfoStateTearOff();

/// @nodoc
mixin _$AddNewPostInfoState {
  String get caption => throw _privateConstructorUsedError;
  String get appBarTitle => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddNewPostInfoStateCopyWith<AddNewPostInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNewPostInfoStateCopyWith<$Res> {
  factory $AddNewPostInfoStateCopyWith(
          AddNewPostInfoState value, $Res Function(AddNewPostInfoState) then) =
      _$AddNewPostInfoStateCopyWithImpl<$Res>;
  $Res call({String caption, String appBarTitle, File? imageFile});
}

/// @nodoc
class _$AddNewPostInfoStateCopyWithImpl<$Res>
    implements $AddNewPostInfoStateCopyWith<$Res> {
  _$AddNewPostInfoStateCopyWithImpl(this._value, this._then);

  final AddNewPostInfoState _value;
  // ignore: unused_field
  final $Res Function(AddNewPostInfoState) _then;

  @override
  $Res call({
    Object? caption = freezed,
    Object? appBarTitle = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      appBarTitle: appBarTitle == freezed
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$AddNewPostInfoStateCopyWith<$Res>
    implements $AddNewPostInfoStateCopyWith<$Res> {
  factory _$AddNewPostInfoStateCopyWith(_AddNewPostInfoState value,
          $Res Function(_AddNewPostInfoState) then) =
      __$AddNewPostInfoStateCopyWithImpl<$Res>;
  @override
  $Res call({String caption, String appBarTitle, File? imageFile});
}

/// @nodoc
class __$AddNewPostInfoStateCopyWithImpl<$Res>
    extends _$AddNewPostInfoStateCopyWithImpl<$Res>
    implements _$AddNewPostInfoStateCopyWith<$Res> {
  __$AddNewPostInfoStateCopyWithImpl(
      _AddNewPostInfoState _value, $Res Function(_AddNewPostInfoState) _then)
      : super(_value, (v) => _then(v as _AddNewPostInfoState));

  @override
  _AddNewPostInfoState get _value => super._value as _AddNewPostInfoState;

  @override
  $Res call({
    Object? caption = freezed,
    Object? appBarTitle = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_AddNewPostInfoState(
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      appBarTitle: appBarTitle == freezed
          ? _value.appBarTitle
          : appBarTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_AddNewPostInfoState implements _AddNewPostInfoState {
  const _$_AddNewPostInfoState(
      {this.caption = "", this.appBarTitle = "New Post", this.imageFile});

  @JsonKey(defaultValue: "")
  @override
  final String caption;
  @JsonKey(defaultValue: "New Post")
  @override
  final String appBarTitle;
  @override
  final File? imageFile;

  @override
  String toString() {
    return 'AddNewPostInfoState(caption: $caption, appBarTitle: $appBarTitle, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddNewPostInfoState &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality()
                    .equals(other.caption, caption)) &&
            (identical(other.appBarTitle, appBarTitle) ||
                const DeepCollectionEquality()
                    .equals(other.appBarTitle, appBarTitle)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(appBarTitle) ^
      const DeepCollectionEquality().hash(imageFile);

  @JsonKey(ignore: true)
  @override
  _$AddNewPostInfoStateCopyWith<_AddNewPostInfoState> get copyWith =>
      __$AddNewPostInfoStateCopyWithImpl<_AddNewPostInfoState>(
          this, _$identity);
}

abstract class _AddNewPostInfoState implements AddNewPostInfoState {
  const factory _AddNewPostInfoState(
      {String caption,
      String appBarTitle,
      File? imageFile}) = _$_AddNewPostInfoState;

  @override
  String get caption => throw _privateConstructorUsedError;
  @override
  String get appBarTitle => throw _privateConstructorUsedError;
  @override
  File? get imageFile => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddNewPostInfoStateCopyWith<_AddNewPostInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
