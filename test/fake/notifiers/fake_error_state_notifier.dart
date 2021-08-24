import 'package:flutter_instagram/common/exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FakeErrorStateNotifier extends StateNotifier<GenericException?> {
  FakeErrorStateNotifier() : super(null);
}
