// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileStateTearOff {
  const _$ProfileStateTearOff();

  _ProfileState call(
      {List<GridPostModel> posts = const [],
      UserModel? user,
      List<StoryModel> highlightedStories = const [],
      bool hasNewStory = false}) {
    return _ProfileState(
      posts: posts,
      user: user,
      highlightedStories: highlightedStories,
      hasNewStory: hasNewStory,
    );
  }
}

/// @nodoc
const $ProfileState = _$ProfileStateTearOff();

/// @nodoc
mixin _$ProfileState {
  /// 投稿データ
  List<GridPostModel> get posts => throw _privateConstructorUsedError;

  /// プロフィールデータ
  UserModel? get user => throw _privateConstructorUsedError;

  /// プロフィールのBIO欄に表示されるストーリーズ
  List<StoryModel> get highlightedStories => throw _privateConstructorUsedError;

  /// 新規ストーリがあるか
  bool get hasNewStory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
  $Res call(
      {List<GridPostModel> posts,
      UserModel? user,
      List<StoryModel> highlightedStories,
      bool hasNewStory});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? user = freezed,
    Object? highlightedStories = freezed,
    Object? hasNewStory = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<GridPostModel>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      highlightedStories: highlightedStories == freezed
          ? _value.highlightedStories
          : highlightedStories // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>,
      hasNewStory: hasNewStory == freezed
          ? _value.hasNewStory
          : hasNewStory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(
          _ProfileState value, $Res Function(_ProfileState) then) =
      __$ProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<GridPostModel> posts,
      UserModel? user,
      List<StoryModel> highlightedStories,
      bool hasNewStory});
}

/// @nodoc
class __$ProfileStateCopyWithImpl<$Res> extends _$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(
      _ProfileState _value, $Res Function(_ProfileState) _then)
      : super(_value, (v) => _then(v as _ProfileState));

  @override
  _ProfileState get _value => super._value as _ProfileState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? user = freezed,
    Object? highlightedStories = freezed,
    Object? hasNewStory = freezed,
  }) {
    return _then(_ProfileState(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<GridPostModel>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      highlightedStories: highlightedStories == freezed
          ? _value.highlightedStories
          : highlightedStories // ignore: cast_nullable_to_non_nullable
              as List<StoryModel>,
      hasNewStory: hasNewStory == freezed
          ? _value.hasNewStory
          : hasNewStory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProfileState implements _ProfileState {
  const _$_ProfileState(
      {this.posts = const [],
      this.user,
      this.highlightedStories = const [],
      this.hasNewStory = false});

  @JsonKey(defaultValue: const [])
  @override

  /// 投稿データ
  final List<GridPostModel> posts;
  @override

  /// プロフィールデータ
  final UserModel? user;
  @JsonKey(defaultValue: const [])
  @override

  /// プロフィールのBIO欄に表示されるストーリーズ
  final List<StoryModel> highlightedStories;
  @JsonKey(defaultValue: false)
  @override

  /// 新規ストーリがあるか
  final bool hasNewStory;

  @override
  String toString() {
    return 'ProfileState(posts: $posts, user: $user, highlightedStories: $highlightedStories, hasNewStory: $hasNewStory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileState &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.highlightedStories, highlightedStories) ||
                const DeepCollectionEquality()
                    .equals(other.highlightedStories, highlightedStories)) &&
            (identical(other.hasNewStory, hasNewStory) ||
                const DeepCollectionEquality()
                    .equals(other.hasNewStory, hasNewStory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(highlightedStories) ^
      const DeepCollectionEquality().hash(hasNewStory);

  @JsonKey(ignore: true)
  @override
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {List<GridPostModel> posts,
      UserModel? user,
      List<StoryModel> highlightedStories,
      bool hasNewStory}) = _$_ProfileState;

  @override

  /// 投稿データ
  List<GridPostModel> get posts => throw _privateConstructorUsedError;
  @override

  /// プロフィールデータ
  UserModel? get user => throw _privateConstructorUsedError;
  @override

  /// プロフィールのBIO欄に表示されるストーリーズ
  List<StoryModel> get highlightedStories => throw _privateConstructorUsedError;
  @override

  /// 新規ストーリがあるか
  bool get hasNewStory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
