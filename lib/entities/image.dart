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

class ImageFileExtension {
  final String fileExtension;

  ImageFileExtension(this.fileExtension);

  static final ImageFileExtension png = ImageFileExtension("png");
  static final ImageFileExtension jpeg = ImageFileExtension("jpeg");

  factory ImageFileExtension.fromFileExtension(String fileExtension) {
    if (fileExtension == "png") {
      return ImageFileExtension.png;
    } else if (fileExtension == "jpeg") {
      return ImageFileExtension.jpeg;
    }
    // TODO: Use SimpleException
    throw UnimplementedError();
  }
}

@immutable
class ImageMetadata {
  final ImageContentType imageContentType;
  final ImageFileExtension imageFileExtension;

  ImageMetadata(
      {required this.imageContentType, required this.imageFileExtension});

  String get contentType => imageContentType.contentType;

  factory ImageMetadata.fromData(Map<String, dynamic> data) {
    final imageContentTypeText = data["image_content_type"] as String?;
    final imageFileExtensionText = data["image_file_extension"] as String?;
    if (imageContentTypeText == null || imageFileExtensionText == null) {
      throw EntityParserException(data);
    }
    final imageContentType =
        ImageContentType.fromContentType(imageContentTypeText);
    final imageFileExtension =
        ImageFileExtension.fromFileExtension(imageFileExtensionText);
    return ImageMetadata(
        imageContentType: imageContentType,
        imageFileExtension: imageFileExtension);
  }

  Map<String, dynamic> get data => {
        "image_content_type": imageContentType.contentType,
        "image_file_extension": imageFileExtension.fileExtension,
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

  static const collectionName = "images";
}
