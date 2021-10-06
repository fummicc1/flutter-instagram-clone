import 'package:flutter_instagram/models/user_model.dart';
import 'package:flutter_instagram/utils/loadable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {

      /// 検索テキスト
      @Default("")
          String searchingText,

      /// ユーザ検索結果
      @Default(Loadable(<UserModel>[]))
          Loadable<List<UserModel>> userSearchResult}) = _SearchState;
}
