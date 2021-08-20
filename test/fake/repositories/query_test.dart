import 'package:flutter_instagram/repositories/query.dart';

extension QueryModelTest on QueryModel {
  bool validate(Map<String, dynamic> data) {
    if (this is EqualQueryModel) {
      final model = this as EqualQueryModel;
      return data[model.fieldName] == model.fieldValue;
    } else if (this is ContainsQueryModel) {
      final model = this as ContainsQueryModel;
      final list = data[model.fieldName] as List<dynamic>?;
      if (list == null) {
        return false;
      }
      return list.contains(model.element);
    }
    return false;
  }
}