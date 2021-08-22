import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<String> getURL(ImageEntity imageEntity);

  /// Create new resource
  /// Create new document in DataStore
  /// Return ID of new imageEntity.
  Future<String> create(
      {required File file, required ImageMetadata imageMetadata});
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

    final fileName = documentReference.id;

    final ImageEntity imageEntity = ImageEntity(
        id: documentReference.id,
        fileName: fileName,
        path: folderName,
        imageMetadata: imageMetadata);

    await _storageClient.uploadFile(
        file: file, path: imageEntity.getFileURL(), contentType: imageMetadata.contentType);

    await _createImageEntity(imageEntity);

    return documentReference.id;
  }

  Future _createImageEntity(ImageEntity imageEntity) async {
    return _firestoreClient.createDoc(
        collectionName: ImageEntity.collectionName, data: imageEntity.data);
  }

  @override
  Future<ImageEntity> find(String id) async {
    final response = await _firestoreClient.getDoc(
        collectionName: ImageEntity.collectionName, documentName: id);
    final image = ImageEntity.fromData(response);
    return image;
  }

  @override
  Future<List<ImageEntity>> findWithQueries(List<QueryModel> queries) async {
    Query query =
    FirebaseFirestore.instance.collection(ImageEntity.collectionName);
    for (QueryModel model in queries) {
      query = model.build(query);
    }
    final response = await _firestoreClient.getWithQuery(query);
    final images = response.map((data) => ImageEntity.fromData(data)).toList();
    return images;
  }

  @override
  Future<List<ImageEntity>> findWithQuery(QueryModel queryModel) {
    return findWithQueries([queryModel]);
  }

  @override
  Future<String> getURL(ImageEntity imageEntity) async {
    final path =
        imageEntity.getFileURL();
    final ref = await _storageClient.getStorageRef(path);
    return _storageClient.getLink(ref);
  }
}
