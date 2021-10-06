import 'package:freezed_annotation/freezed_annotation.dart';

part 'loadable.freezed.dart';

@freezed
class Loadable<T> with _$Loadable {
  const factory Loadable(T value) = Data;
  const factory Loadable.loading() = Loading;
  const factory Loadable.error([String? message]) = ErrorDetails;
}
