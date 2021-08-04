import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class UserEntity {
  final String id;
  final String displayName;
  final String userId;
  final DocumentReference profileImageReference;

  UserEntity(
      {required this.id,
      required this.displayName,
      required this.userId,
      required this.profileImageReference});
}
