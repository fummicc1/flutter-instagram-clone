import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<String> getURL(
      {required String path, required ImageMetadata imageMetadata});

  /// Create new resource
  /// Create new document in DataStore
  /// Return ID of new imageEntity.
  Future<String> create({required File file, required ImageMetadata imageMetadata});
}

class ImageRepository implements IImageRepository {
  IStorageClient _storageClient;
  IFirestoreClient _firestoreClient;

  ImageRepository(this._firestoreClient, this._storageClient);

  @override
  Future<String> create(
      {required File file, required ImageMetadata imageMetadata}) async {
    final folderName = "images/";

    final documentReference =
        FirebaseFirestore.instance.collection(ImageEntity.collectionName).doc();

    final fileName = documentReference.id + "";

    final storagePath = folderName + fileName;

    await _storageClient.uploadFile(
        file: file, path: storagePath, contentType: imageMetadata.contentType);

    final ImageEntity imageEntity = ImageEntity(
        id: documentReference.id,
        storageRef: storagePath,
        imageMetadata: imageMetadata);
    await _createImageEntity(imageEntity);

    return documentReference.id;
  }

  Future _createImageEntity(ImageEntity imageEntity) async {
    return _firestoreClient.createDoc(
        collectionName: ImageEntity.collectionName, data: imageEntity.data);
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
  Future<String> getURL(
      {required String path, required ImageMetadata imageMetadata}) {
    // TODO: implement getURL
    throw UnimplementedError();
  }
}
