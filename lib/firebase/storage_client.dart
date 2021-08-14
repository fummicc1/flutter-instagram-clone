import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

abstract class IStorageClient {
  Future<UploadTask> uploadFile(
      {required File file, required String path, required String contentType});

  Future<File> downloadFile(Reference ref);

  Future<String> getLink(Reference ref);

  Future<Reference> getStorageRef(String path);
}

class StorageClient {
  final FirebaseStorage _storage;
  StorageClient(this._storage);

  // ファイルをアップロードする
  // Taskを返すけど使い方がよくわかっていない
  Future<UploadTask?> uploadFile(
    File? file,
    String storePath,
    String contentType,
  ) async {
    if (file == null) {
      return Future.error("Invalid File Path");
    }

    final ref = _storage.ref(storePath);
    final metadata = SettableMetadata(contentType: contentType);

    return Future.value(ref.putFile(file, metadata));
  }

  // ダウンロード先の一時ファイルを返す
  Future<File?> downloadFile(Reference ref) async {
    final Directory systemTempDir = Directory.systemTemp;
    final File tempFile = File("${systemTempDir.path}/temp-${ref.name}");
    if (tempFile.existsSync()) await tempFile.delete();

    var result = await ref.writeToFile(tempFile);
    if (result.state == TaskState.success) {
      return tempFile;
    }
    return Future.error("Failed to download");
  }

  // Image.network()で直接セットできるURLを取得する
  Future<String?> getLink(Reference ref) async {
    return await ref.getDownloadURL();
  }

  Future<Reference> getStorageRef(String dir, String fileName) async {
    return _storage.ref("$dir/$fileName");
  }
}
