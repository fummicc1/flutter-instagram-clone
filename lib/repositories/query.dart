import 'package:cloud_firestore/cloud_firestore.dart';

mixin QueryModel {
  Query build(Query base);
}

class EqualQueryModel with QueryModel {
  final String fieldName;
  final Object fieldValue;

  EqualQueryModel({required this.fieldName, required this.fieldValue});

  @override
  Query<Object?> build(Query<Object?> base) =>
      base.where(fieldName, isEqualTo: fieldValue);
}

class ContainsQueryModel with QueryModel {
  final String fieldName;
  final Object element;

  ContainsQueryModel({required this.fieldName, required this.element});

  @override
  Query<Object?> build(Query<Object?> base) =>
      base.where(fieldName, arrayContains: element);
}
