import 'package:flutter/material.dart';

@immutable
class ImageEntity {
  final String? id;
  final String storageRef;
  final String contentType;

  ImageEntity({required this.id, required this.storageRef, required this.contentType});
}
