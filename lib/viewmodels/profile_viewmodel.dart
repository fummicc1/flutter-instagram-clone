import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/user_model.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/post_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/profile_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final IUserRepository _userRepository;
  final IPostRepository _postRepository;
  final IImageRepository _imageRepository;
  final String userID;

  ProfileViewModel(
      this._userRepository, this._postRepository, this._imageRepository,
      {required this.userID})
      : super(ProfileState());

  Future<UserModel> fetchUser() async {
    final userEntity = await _userRepository.findWithID(userID);

    if (userEntity == null) {
      throw UserException.notFound(userID);
    }

    final imageReference = userEntity.profileImageReference;

    final imageEntity = await _imageRepository.find(imageReference.id);

    if (imageEntity == null) {
      throw SimpleException("No ImageEntity");
    }

    final avatarURL = await _imageRepository.getURL(imageEntity);

    if (avatarURL == null) {
      throw SimpleException("No avatarURL");
    }

    final avatar = ImageModel(resource: avatarURL);

    final userModel = UserModel(
        userID: userID,
        displayName: userEntity.displayName,
        bio: userEntity.bio,
        avatar: avatar);

    return userModel;
  }
}
