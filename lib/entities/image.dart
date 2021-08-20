import 'package:flutter/material.dart';

enum ImageFileType { PNG, JPEG }

@immutable
class ImageMetadata {
  final ImageFileType fileType;

  ImageMetadata({required this.fileType});

  String? get contentType {
    if (fileType == ImageFileType.JPEG) {
      return "image/jpeg";
    } else if (fileType == ImageFileType.PNG) {
      return "image/png";
    }
    return null;
  }
}

@immutable
class ImageEntity {
  final String? id;
  final String storageRef;
  final ImageMetadata imageMetadata;

  ImageEntity(
      {required this.id,
      required this.storageRef,
      required this.imageMetadata});
}
