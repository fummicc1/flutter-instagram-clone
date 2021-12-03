import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_instagram/entities/post.dart';
import 'package:flutter_instagram/repositories/post_repository.dart';
import 'package:flutter_instagram/repositories/query.dart';

class FakePostRepository extends IPostRepository {

  Map<DocumentReference, PostEntity> _data = {};

  final FakeFirebaseFirestore _fakeFirebaseFirestore =  FakeFirebaseFirestore();

  @override
  Future create(PostEntity postEntity) async {
    final ref = _fakeFirebaseFirestore.collection(PostEntity.collectionName).doc(postEntity.id);
    _data[ref] = postEntity;
  }

  @override
  Future<List<PostEntity>> findWithQueries(List<QueryModel> queries) async {
    var data = _data;

    for (QueryModel queryModel in queries) {
      if (queryModel is EqualQueryModel) {
        final fieldName = queryModel.fieldName;
        final fieldValue = queryModel.fieldValue;
        data.removeWhere((key, value) => value.data[fieldName] != fieldValue);
      } else if (queryModel is ContainsQueryModel) {
        final fieldName = queryModel.fieldName;
        final element = queryModel.element;
        data.removeWhere( (key, value) {
          final list = value.data[fieldName] as List;
          return !list.contains(element);
        });
      }
    }

    return data.values.toList();
  }

  @override
  Future<List<PostEntity>> findWithQuery(QueryModel query) async {
    return findWithQueries([query]);
  }

  @override
  Future update({required String id, required PostEntity newEntity}) async {
    final ref = _fakeFirebaseFirestore.collection(PostEntity.collectionName).doc(id);
    _data[ref] = newEntity;
  }
}