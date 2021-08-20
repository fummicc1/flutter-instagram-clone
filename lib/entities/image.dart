import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';

class ImageContentType {
  final String contentType;

  ImageContentType(this.contentType);

  static final ImageContentType png = ImageContentType("image/png");
  static final ImageContentType jpeg = ImageContentType("image/jpeg");

  factory ImageContentType.fromContentType(String contentType) {
    if (contentType == "image/png") {
      return ImageContentType.png;
    } else if (contentType == "image/jpeg") {
      return ImageContentType.jpeg;
    }
    // TODO: Use SimpleException
    throw UnimplementedError();
  }
}

@immutable
class ImageMetadata {
  final ImageContentType imageContentType;

  ImageMetadata({required this.imageContentType});

  String get contentType => imageContentType.contentType;

  factory ImageMetadata.fromData(Map<String, dynamic> data) {
    final imageContentTypeText = data["image_content_type"] as String?;
    if (imageContentTypeText == null) {
      throw EntityParserException(data);
    }
    final imageContentType =
        ImageContentType.fromContentType(imageContentTypeText);
    return ImageMetadata(imageContentType: imageContentType);
  }

  Map<String, dynamic> get data => {
    "image_content_type": imageContentType.contentType
  };
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

  factory ImageEntity.fromData(Map<String, dynamic> data) {
    final id = data["id"] as String?;
    final storageRef = data["storage_ref"] as String?;

    if (id == null || storageRef == null) {
      throw EntityParserException(data);
    }

    final imageMetadataData = data["image_metadata"];
    final imageMetadata = ImageMetadata.fromData(imageMetadataData);

    return ImageEntity(
        id: id, storageRef: storageRef, imageMetadata: imageMetadata);
  }

  Map<String, dynamic> get data => {
    "id": id,
    "storage_ref": storageRef,
    "image_metadata": imageMetadata.data
  };
}
