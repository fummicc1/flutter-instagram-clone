
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_instagram/models/image_model.dart';
import 'package:flutter_instagram/models/post.dart';

mixin SendNewPostUsecase {
  Future execute({required Uint8List postImage, required String message}) async {}
}

class SendNewPostUseCaseImpl with SendNewPostUsecase {

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  SendNewPostUseCaseImpl(this._firebaseFirestore, this._firebaseStorage);

  @override
  Future execute({required Uint8List postImage, required String message}) async {
    final Map<String, dynamic> map = {
      "message": message,
      "like_count": 0,
      "created_at": Timestamp.now(),
      "updated_at": Timestamp.now()
    };

    final DocumentReference postRef = _firebaseFirestore.collection("posts").doc();

    try {
      final imageUploader = await _firebaseStorage.ref("/posts/${postRef.id}").putData(postImage);
      map["post_image"] = imageUploader.ref.fullPath;
      return postRef.set(map);
    } catch (e) {
      return Future.error(e);
    }
  }
}