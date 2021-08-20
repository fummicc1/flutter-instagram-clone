import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instagram/entities/post.dart';
import 'package:flutter_instagram/firebase/firestore_client.dart';
import 'package:flutter_instagram/repositories/query.dart';

abstract class IPostRepository {
  Future create(PostEntity postEntity);

  Future update({required String id, required PostEntity newEntity});

  Future<List<PostEntity>> findWithQueries(List<QueryModel> queries);

  Future<List<PostEntity>> findWithQuery(QueryModel query);
}

class PostRepository implements IPostRepository {
  IFirestoreClient _firestoreClient;

  PostRepository(this._firestoreClient);

  @override
  Future create(PostEntity postEntity) async {
    await _firestoreClient.createDoc(
        collectionName: PostEntity.collectionName, data: postEntity.data);
  }

  @override
  Future update({required String id, required PostEntity newEntity}) async {
    await _firestoreClient.updateDocWithPath(
        collection: PostEntity.collectionName,
        documentId: id,
        data: newEntity.data);
  }

  @override
  Future<List<PostEntity>> findWithQuery(QueryModel query) async {
    return findWithQueries([query]);
  }

  @override
  Future<List<PostEntity>> findWithQueries(List<QueryModel> queries) async {
    Query ref = _firestoreClient.buildCollectionReference(
        collectionName: PostEntity.collectionName);
    for (QueryModel queryModel in queries) {
      ref = queryModel.build(ref);
    }
    final response = await _firestoreClient.getWithQuery(ref);
    final result = response.map((data) => PostEntity.fromData(data)).toList();
    return result;
  }
}
