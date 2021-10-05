import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/entities/image.dart';
import 'package:flutter_instagram/entities/post.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/repositories/auth_repository.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/post_repository.dart';
import 'package:flutter_instagram/repositories/user_repository.dart';
import 'package:flutter_instagram/services/photo_service.dart';
import 'package:flutter_instagram/states/new_post_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPostViewModel extends StateNotifier<NewPostState> {
  NewPostViewModel(
      NewPostState state,
      this._postRepository,
      this._userRepository,
      this._authRepository,
      this._imageRepository,
      this._photoService,
      this._reader)
      : super(state) {
    fetchNewPhotos();
  }

  final IPostRepository _postRepository;
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;
  final IImageRepository _imageRepository;
  final IPhotoService _photoService;
  final Reader _reader;

  int _currentPhotoPage = 1;

  bool get canMoveToNewPostSettingsPage => state.imageFile != null;

  fetchNewPhotos() async {
    final granted = await _photoService.requestAuthorization();
    if (!granted) return;
    _photoService.fetchPhotos(page: _currentPhotoPage).listen((file) {
      state = state.copyWith(photos: state.photos + [file]);
    });
    _currentPhotoPage += 1;
  }

  updateCaption(String caption) {
    state = state.copyWith(caption: caption);
  }

  updateImageFile(File file) {
    state = state.copyWith(imageFile: file);
  }

  Future submit() async {
    try {
      if (canMoveToNewPostSettingsPage) return;
      if (state.caption.isEmpty) return;

      final uid = _authRepository.getCurrentUserId();
      if (uid == null) {
        return;
      }
      final senderId = await _userRepository.uidToUserId(uid);

      if (senderId == null) {
        return;
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
          likedUserIdList: [],
          createdAt: Timestamp.now(),
          imageDocumentReferenceList: imageIdList);
      await _postRepository.create(post);
    } on GenericException catch (exception) {
      _reader(errorStateProvider).state = exception;
    } catch (e) {
      _reader(errorStateProvider).state = SimpleException(e.toString());
    }
  }
}
