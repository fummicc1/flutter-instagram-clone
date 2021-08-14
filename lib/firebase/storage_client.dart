import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

abstract class IStorageClient {
  // ファイルをアップロードする
  // Taskを返すけど使い方がよくわかっていない
  Future<UploadTask> uploadFile(
      {required File file, required String path, required String contentType});

  // ダウンロード先の一時ファイルを返す
  Future<File> downloadFile(Reference ref);

  // Image.network()で直接セットできるURLを取得する
  Future<String> getLink(Reference ref);

  Future<Reference> getStorageRef(String path);
}

class StorageClient implements IStorageClient {
  final FirebaseStorage _storage;
  StorageClient(this._storage);

  @override
  Future<UploadTask> uploadFile({
    required File file,
    required String path,
    required String contentType,
  }) async {
    final ref = _storage.ref(path);
    final metadata = SettableMetadata(contentType: contentType);

    return Future.value(ref.putFile(file, metadata));
  }

  @override
  Future<File> downloadFile(Reference ref) async {
    final Directory systemTempDir = Directory.systemTemp;
    final File tempFile = File("${systemTempDir.path}/temp-${ref.name}");
    if (tempFile.existsSync()) await tempFile.delete();

    var result = await ref.writeToFile(tempFile);
    if (result.state == TaskState.success) {
      return tempFile;
    }
    return Future.error("Failed to download");
  }

  @override
  Future<String> getLink(Reference ref) async {
    return await ref.getDownloadURL();
  }

  @override
  Future<Reference> getStorageRef(String path) async {
    return _storage.ref(path);
  }
}
