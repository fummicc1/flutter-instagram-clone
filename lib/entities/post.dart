// Entity...FirestoreなどDBに保存されるデータモデル
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class PostEntity {
  final String id; // ID
  final String message; // 投稿内容
  final String senderId; // 投稿者のUserID
  final List<String> likedUserIdList; // いいねしたユーザーのID一覧
  final Timestamp createdAt; // 作成
  final List<DocumentReference> imageDocumentReferenceList; // imagesコレクション内にある画像のDocumentReference一覧

  PostEntity(
      {required this.id,
      required this.message,
      required this.senderId,
      required this.likedUserIdList,
      required this.createdAt,
      required this.imageDocumentReferenceList});
}
