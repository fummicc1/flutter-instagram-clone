import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/search_state.dart';
import 'package:flutter_instagram/utils/loadable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends StateNotifier<SearchState> {
  final IUserRepository _userRepository;
  final IImageRepository _imageRepository;

  // constにすると型でエラーが出るので
  SearchViewModel(this._userRepository, this._imageRepository)
      // ignore: prefer_const_constructors
      : super(SearchState());

  Future<void> updateSearchText(String newText) async {
    state = state.copyWith(searchingText: newText);
    await _search(newText);
  }

  Future<void> _search(String searchText) async {
    state = state.copyWith(userSearchResult: const Loadable.loading());
    try {
      final result =
          await _userRepository.searchWithUserIdContaining(searchText);
      state = state.copyWith(
          userSearchResult: Loadable(await Future.wait(result.map((e) async {
        final imageReference = e.profileImageReference;

        // Default Image
        ImageModel avatar;

        if (imageReference != null) {
          try {
            final imageEntity = await _imageRepository.find(imageReference.id);
            final avatarURL = await _imageRepository.getURL(imageEntity);
            avatar = ImageModel(resource: avatarURL);
          } catch (e) {
            avatar = ImageModel(resource: "https://via.placeholder.com/150");
          }
        } else {
          avatar = ImageModel(resource: "https://via.placeholder.com/150");
        }
        return UserModel(
            userID: e.userId,
            displayName: e.displayName,
            bio: e.bio,
            avatar: avatar,
            posts: const [],
            followerCount: 0,
            followeeCount: 0);
      }))));
    } catch (e) {
      state = state.copyWith(userSearchResult: const Loadable.error());
    }
  }
}
