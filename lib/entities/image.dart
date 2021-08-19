import 'package:flutter/material.dart';
import 'package:flutter_instagram/common/exception.dart';

@immutable
class ImageEntity {
  final String? id;
  final String storageRef;

  ImageEntity({required this.id, required this.storageRef});

  factory ImageEntity.fromData(Map<String, dynamic> data) {
    final id = data["id"] as String?;
    final storageRef = data["storage_ref"] as String?;
    if (id == null || storageRef == null) {
      throw EntityParserException(data);
    }
    return ImageEntity(
        id: id,
        storageRef: storageRef
    );
  }

  Map<String, dynamic> get data => {
    "id": id,
    "storage_ref": storageRef
  };
}
