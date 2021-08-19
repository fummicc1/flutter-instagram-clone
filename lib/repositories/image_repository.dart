import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_instagram/entities/image.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';
import 'package:flutter_instagram/firebase/storage_client.dart';
import 'package:flutter_instagram/repositories/query.dart';

abstract class IImageRepository {
  /// Find specific imageEntity from Database
  Future<ImageEntity> find(String id);
  /// Find imageEntities with single query
  Future<List<ImageEntity>> findWithQuery(QueryModel queryModel);
  /// Find imageEntities with multiple queries
  Future<List<ImageEntity>> findWithQueries(List<QueryModel> queries);

  /// Get url to download image from File-Storage
  Future<String> getURL(String ref);

  /// Create new resource
  Future create({required ImageEntity imageEntity, required File file});
  /// Delete existing resource
  Future delete({required ImageEntity imageEntity, File? file});
}

class ImageRepository implements IImageRepository {

  final FirestoreClient _firestoreClient;
  final StorageClient _storageClient;

  static const _collectionName = "images";

  ImageRepository(this._firestoreClient, this._storageClient);

  @override
  Future create(ImageEntity imageEntity) async {
    try {
      final data = imageEntity.data;
       await _firestoreClient.createDoc(collectionName: _collectionName, data: data);

       _storageClient.uploadFile(file: file, path: path, contentType: contentType)
    } catch {

    }
  }

  @override
  Future delete(ImageEntity imageEntity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ImageEntity> find(String id) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<ImageEntity>> findWithQueries(List<QueryModel> queries) {
    // TODO: implement findWithQueries
    throw UnimplementedError();
  }

  @override
  Future<List<ImageEntity>> findWithQuery(QueryModel queryModel) {
    // TODO: implement findWithQuery
    throw UnimplementedError();
  }

  @override
  Future<String> getURL(String ref) async {
    final Reference ref = _storageClient.getStorageRef(ref);
    _storageClient.downloadFile(ref)
  }

}