import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/entities/image.dart';
import 'package:flutter_instagram/entities/post.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/post_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/states/add_new_post_info_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPostInfoViewModel extends StateNotifier<AddNewPostInfoState> {
  AddNewPostInfoViewModel(
      AddNewPostInfoState state,
      this._postRepository,
      this._userRepository,
      this._authRepository,
      this._imageRepository,
      this._reader)
      : super(state);

  final IPostRepository _postRepository;
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;
  final IImageRepository _imageRepository;
  final Reader _reader;

  updateCaption(String caption) {
    state = state.copyWith(caption: caption);
  }

  Future<bool> submit() async {
    try {
      if (state.caption.isEmpty) return false;

      final uid = _authRepository.getCurrentUserId();
      if (uid == null) {
        return false;
      }
      final senderId = await _userRepository.uidToUserId(uid);

      if (senderId == null) {
        return false;
      }

      List<String> imageIdList = [];
      final imageFile = state.imageFile;

      if (imageFile != null) {
        final documentID = await _imageRepository.create(
            file: imageFile, imageMetadata: ImageMetadata.png);
        imageIdList.add(documentID);
      }

      final id = FirebaseFirestore.instance
          .collection(PostEntity.collectionName)
          .doc()
          .id;

      final post = PostEntity(
          id: id,
          message: state.caption,
          senderId: senderId,
          likedUserIdList: const [],
          createdAt: Timestamp.now(),
          imageDocumentReferenceList: imageIdList);
      await _postRepository.create(post);
      return true;
    } on GenericException catch (exception) {
      _reader(errorStateProvider).state = exception;
    } catch (e) {
      _reader(errorStateProvider).state = SimpleException(e.toString());
    }
    return false;
  }
}
