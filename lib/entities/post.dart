import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/firebase/firestore_model.dart';

// Entity...FirestoreなどDBに保存されるデータモデル
@immutable
class PostEntity with FirestoreModel {
  final String id; // ID
  final String message; // 投稿内容
  final String senderId; // 投稿者のUserID
  final List<String> likedUserIdList; // いいねしたユーザーのID一覧
  final Timestamp createdAt; // 作成
  final List<DocumentReference>
      imageDocumentReferenceList; // imagesコレクション内にある画像のDocumentReference一覧

  PostEntity(
      {required this.id,
      required this.message,
      required this.senderId,
      required this.likedUserIdList,
      required this.createdAt,
      required this.imageDocumentReferenceList});

  factory PostEntity.fromData(Map<String, dynamic> data) {
    final id = data["id"] as String?;
    final message = data["message"] as String?;
    final senderId = data["sender_id"] as String?;
    final likedUserIdList = data["liked_user_id_list"] as List<String>?;
    final createdAt = data["created_at"] as Timestamp?;
    final imageDocumentReferenceList =
        data["image_document_reference_list"] as List<DocumentReference>?;

    if (id == null ||
        message == null ||
        senderId == null ||
        likedUserIdList == null ||
        createdAt == null ||
        imageDocumentReferenceList == null) {
      throw EntityParserException(data);
    }
    return PostEntity(
        id: id,
        message: message,
        senderId: senderId,
        likedUserIdList: likedUserIdList,
        createdAt: createdAt,
        imageDocumentReferenceList: imageDocumentReferenceList);
  }

  @override
  Map<String, dynamic> get data => {
        "id": id,
        "message": message,
        "sender_id": senderId,
        "liked_user_id_list": likedUserIdList,
        "created_at": createdAt,
        "image_document_reference_list": imageDocumentReferenceList
      };

  static const String collectionName = "posts";
}
