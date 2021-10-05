import 'dart:async';
import 'dart:io';

import 'package:photo_manager/photo_manager.dart';

abstract class IPhotoService {
  Future<bool> requestAuthorization();

  Stream<File> fetchPhotos({required int page});
}

class PhotoService implements IPhotoService {
  final _pageSize = 20;

  @override
  Future<bool> requestAuthorization() async {
    final granted = await PhotoManager.requestPermission();
    return granted;
  }

  @override
  Stream<File> fetchPhotos({required int page}) {
    final subject = StreamController<File>();
    try {
      final filterOption = FilterOptionGroup();
      filterOption.addOrderOption(
          const OrderOption(type: OrderOptionType.createDate, asc: false));
      filterOption.addOrderOption(
          const OrderOption(type: OrderOptionType.updateDate, asc: false));
      PhotoManager.getAssetPathList(
          type: RequestType.image, onlyAll: true, filterOption: filterOption)
          .then((groupList) async {
        for (final group in groupList) {
          final entities = await group.getAssetListPaged(page, _pageSize);
          for (final entity in entities) {
            final file = await entity.file;
            if (file == null) return;
            subject.add(file);
          }
        }
      });
    } catch (err) {
      print(err);
    }
    return subject.stream;
  }
}
