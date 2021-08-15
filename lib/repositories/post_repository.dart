import 'package:flutter_instagram/entities/post.dart';
import 'package:flutter_instagram/repositories/query.dart';

abstract class IPostRepository {
  Future create(PostEntity postEntity);
  Future update({required String id, required PostEntity newEntity});
  Future<List<PostEntity>> findWithQueries(List<QueryModel> queries);
  Future<List<PostEntity>> findWithQuery(QueryModel query);
}

