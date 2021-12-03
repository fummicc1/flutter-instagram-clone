import 'dart:async';
import 'dart:io';

import 'package:flutter_instagram/services/photo_service.dart';

class FakePhotoService implements IPhotoService {

  FakePhotoService({ required this.canGrant });

  bool canGrant;
  bool fetchPhotoIsCalled = false;
  final StreamController<File> _fakePhotoStreamController = StreamController();

  @override
  Future<bool> requestAuthorization() async => canGrant;

  @override
  Stream<File> fetchPhotos({required int page}) {
    fetchPhotoIsCalled = true;
    return _fakePhotoStreamController.stream;
  }


}