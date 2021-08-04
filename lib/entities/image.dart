import 'package:flutter/material.dart';

@immutable
class ImageEntity {
  final String? id;
  final String storageRef;

  ImageEntity({required this.id, required this.storageRef});
}
