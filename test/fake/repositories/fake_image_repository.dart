import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_instagram/entities/image.dart';
import 'package:flutter_instagram/repositories/image_repository.dart';
import 'package:flutter_instagram/repositories/query.dart';
import 'query_test.dart';

class FakeImageRepository implements IImageRepository {
  Map<String, File> _fileCache = {};
  Map<DocumentReference, ImageEntity> _entitiesCache = {};

  final FakeFirebaseFirestore _fakeFirebaseFirestore = FakeFirebaseFirestore();

  @override
  Future<String> create(
      {required File file, required ImageMetadata imageMetadata}) async {
    final documentReference =
        _fakeFirebaseFirestore.collection(ImageEntity.collectionName).doc();
    final entity = ImageEntity(
      id: documentReference.id,
      path: "images/",
      fileName: documentReference.id,
      imageMetadata: imageMetadata,
    );

    final url = entity.getFileURL();

    _fileCache[url] = file;
    _entitiesCache[documentReference] = entity;
    return documentReference.id;
  }

  @override
  Future<ImageEntity> find(String id) async {
    return _entitiesCache.values.firstWhere((entity) => entity.id == id);
  }

  @override
  Future<List<ImageEntity>> findWithQueries(List<QueryModel> queries) async {
    List<ImageEntity> response = _entitiesCache.values.toList();
    for (QueryModel model in queries) {
      response = response.where((value) => model.validate(value.data)).toList();
    }
    return response;
  }

  @override
  Future<List<ImageEntity>> findWithQuery(QueryModel queryModel) =>
      findWithQueries([queryModel]);

  @override
  Future<String> getURL(ImageEntity imageEntity) async {
    return "https://via.placeholder.com/150";
  }
}
