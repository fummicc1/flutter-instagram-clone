import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/firebase/firestore_model.dart';

@immutable
class UserEntity with FirestoreModel {
  final String id;
  final String displayName;
  final String userId;
  final DocumentReference? profileImageReference;

  UserEntity(
      {required this.id,
      required this.displayName,
      required this.userId,
      required this.profileImageReference});

  factory UserEntity.fromData(Map<String, dynamic> data) {
    final id = data["id"] as String?;
    final displayName = data["display_name"] as String?;
    final userId = data["user_id"] as String?;
    final profileImageReference =
        data["profile_image_reference"] as DocumentReference?;
    if (id == null ||
        displayName == null ||
        userId == null ||
        profileImageReference == null) {
      throw EntityParserException(data);
    }
    return UserEntity(
        id: id,
        displayName: displayName,
        userId: userId,
        profileImageReference: profileImageReference);
  }

  @override
  Map<String, dynamic> get data => {
        "id": id,
        "display_name": displayName,
        "user_id": userId,
        "profile_image_reference": profileImageReference
      };

  static const collectionName = "users";
}
