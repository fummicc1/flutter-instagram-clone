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
  Future<String> getURL();

  /// Create new resource
  Future create(ImageEntity imageEntity);
  /// Delete existing resource
  Future delete(ImageEntity imageEntity);
}