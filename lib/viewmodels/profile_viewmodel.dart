import 'package:flutter/cupertino.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/entities/post.dart';
import 'package:flutter_instagram/models/grid_post_model.dart';
import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/story.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/post_repository.dart';
import 'package:flutter_instagram/repositories/query.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final IUserRepository _userRepository;
  final IPostRepository _postRepository;
  final IImageRepository _imageRepository;
  final String userID;

  ProfileViewModel(this._userRepository, this._postRepository,
      this._imageRepository,
      {required this.userID})
      : super(ProfileState());

  Future<UserModel> fetchUser() async {
    final userEntity = await _userRepository.findWithID(userID);

    if (userEntity == null) {
      throw UserException.notFound(userID);
    }

    final imageReference = userEntity.profileImageReference;

    // Default Image
    ImageModel avatar = ImageModel(resource: "https://via.placeholder.com/150");
    
    if (imageReference != null) {
      final imageEntity = await _imageRepository.find(imageReference.id);
      final avatarURL = await _imageRepository.getURL(imageEntity);
      avatar = ImageModel(resource: avatarURL);
    }

    final myPosts = await fetchOwnPosts();

    final userModel = UserModel(
        userID: userID,
        displayName: userEntity.displayName,
        bio: userEntity.bio,
        avatar: avatar,
        posts: myPosts,
        followeeCount: 0,
        followerCount: 0);

    return userModel;
  }

  Future<List<GridPostModel>> fetchOwnPosts() async {
    final EqualQueryModel queryModel =
    EqualQueryModel(fieldName: "sender_id", fieldValue: userID);
    final postEntities = await _postRepository.findWithQuery(queryModel);
    List<GridPostModel> postModels = [];
    for (PostEntity entity in postEntities) {
      final postID = entity.id;
      final imageID = entity.imageDocumentReferenceList[0].id;
      final image = await _imageRepository.find(imageID);
      final imageURL = await _imageRepository.getURL(image);
      final model = GridPostModel(
          postID: postID,
          topImageURL: imageURL,
          hasMultipleImage: entity.imageDocumentReferenceList.length >= 2);
      postModels.add(model);
    }
    return postModels;
  }

  Future<List<StoryModel>> fetchOwnStories() async {
    // TODO: Implement Story
    return [];
  }

  Future setup() async {
    final user = await fetchUser();
    state = state.copyWith(user: user,
        posts: user.posts,
        storyHighlightsList: [],
        hasNewStory: false,
        isMyAccount: user.userID == userID);
  }
}
