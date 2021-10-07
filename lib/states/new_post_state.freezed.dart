// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'new_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewPostStateTearOff {
  const _$NewPostStateTearOff();

  _NewPostState call(
      {File? imageFile, String? albumName, List<File> photos = const []}) {
    return _NewPostState(
      imageFile: imageFile,
      albumName: albumName,
      photos: photos,
    );
  }
}

/// @nodoc
const $NewPostState = _$NewPostStateTearOff();

/// @nodoc
mixin _$NewPostState {
  File? get imageFile => throw _privateConstructorUsedError;
  String? get albumName => throw _privateConstructorUsedError;
  List<File> get photos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPostStateCopyWith<NewPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPostStateCopyWith<$Res> {
  factory $NewPostStateCopyWith(
          NewPostState value, $Res Function(NewPostState) then) =
      _$NewPostStateCopyWithImpl<$Res>;
  $Res call({File? imageFile, String? albumName, List<File> photos});
}

/// @nodoc
class _$NewPostStateCopyWithImpl<$Res> implements $NewPostStateCopyWith<$Res> {
  _$NewPostStateCopyWithImpl(this._value, this._then);

  final NewPostState _value;
  // ignore: unused_field
  final $Res Function(NewPostState) _then;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? albumName = freezed,
    Object? photos = freezed,
  }) {
    return _then(_value.copyWith(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      albumName: albumName == freezed
          ? _value.albumName
          : albumName // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc
abstract class _$NewPostStateCopyWith<$Res>
    implements $NewPostStateCopyWith<$Res> {
  factory _$NewPostStateCopyWith(
          _NewPostState value, $Res Function(_NewPostState) then) =
      __$NewPostStateCopyWithImpl<$Res>;
  @override
  $Res call({File? imageFile, String? albumName, List<File> photos});
}

/// @nodoc
class __$NewPostStateCopyWithImpl<$Res> extends _$NewPostStateCopyWithImpl<$Res>
    implements _$NewPostStateCopyWith<$Res> {
  __$NewPostStateCopyWithImpl(
      _NewPostState _value, $Res Function(_NewPostState) _then)
      : super(_value, (v) => _then(v as _NewPostState));

  @override
  _NewPostState get _value => super._value as _NewPostState;

  @override
  $Res call({
    Object? imageFile = freezed,
    Object? albumName = freezed,
    Object? photos = freezed,
  }) {
    return _then(_NewPostState(
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      albumName: albumName == freezed
          ? _value.albumName
          : albumName // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: photos == freezed
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _$_NewPostState implements _NewPostState {
  const _$_NewPostState(
      {this.imageFile, this.albumName, this.photos = const []});

  @override
  final File? imageFile;
  @override
  final String? albumName;
  @JsonKey(defaultValue: const [])
  @override
  final List<File> photos;

  @override
  String toString() {
    return 'NewPostState(imageFile: $imageFile, albumName: $albumName, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewPostState &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.albumName, albumName) ||
                const DeepCollectionEquality()
                    .equals(other.albumName, albumName)) &&
            (identical(other.photos, photos) ||
                const DeepCollectionEquality().equals(other.photos, photos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(albumName) ^
      const DeepCollectionEquality().hash(photos);

  @JsonKey(ignore: true)
  @override
  _$NewPostStateCopyWith<_NewPostState> get copyWith =>
      __$NewPostStateCopyWithImpl<_NewPostState>(this, _$identity);
}

abstract class _NewPostState implements NewPostState {
  const factory _NewPostState(
      {File? imageFile,
      String? albumName,
      List<File> photos}) = _$_NewPostState;

  @override
  File? get imageFile => throw _privateConstructorUsedError;
  @override
  String? get albumName => throw _privateConstructorUsedError;
  @override
  List<File> get photos => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewPostStateCopyWith<_NewPostState> get copyWith =>
      throw _privateConstructorUsedError;
}
