import 'package:flutter_instagram/common/exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin ExceptionStorable {

  GenericException? exception;

  send(GenericException exception);
}

class ExceptionNotifier extends StateNotifier<GenericException?> with ExceptionStorable {
  ExceptionNotifier(GenericException? state) : super(state);

  @override
  GenericException? get exception => state;

  @override
  send(GenericException exception) {
    state = exception;
  }
}