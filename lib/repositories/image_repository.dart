import 'dart:io';

import 'package:flutter_instagram/entities/image.dart';
import 'package:flutter_instagram/repositories/query.dart';

abstract class IImageRepository {
  /// Find specific imageEntity from Database
  Future<ImageEntity> find(String id);
  /// Find imageEntities with single query
  Future<List<ImageEntity>> findWithQuery(QueryModel queryModel);
  /// Find imageEntities with multiple queries
  Future<List<ImageEntity>> findWithQueries(List<QueryModel> queries);

  /// Get url to download image from File-Storage
  Future<String> getURL(ImageEntity imageEntity);

  /// Create new resource
  /// Create new document in DataStore
  /// Return ID of new imageEntity.
  Future<String> create({required File file, required ImageMetadata imageMetadata});
}