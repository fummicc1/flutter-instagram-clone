import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirestoreClient {
  Stream<List<Map<String, dynamic>>> listenCollection(String collectionName);

  Stream<Map<String, dynamic>> listenDoc(
      {required String collectionName, required String documentName});

  Future<List<Map<String, dynamic>>> getCollection(String collectionName);

  Future<Map<String, dynamic>> getDoc(
      {required String collectionName, required String documentName});

  Future createDoc(
      {required String collectionName,
      String? documentId,
      required Map<String, dynamic> data});

  Future updateDocWithReference(
      {required DocumentReference reference,
      required Map<String, dynamic> data});

  Future updateDocWithPath(
      {required String collection,
      required String documentId,
      required Map<String, dynamic> data});

  Future deleteDocWithReference(DocumentReference reference);

  Future deleteDocWithPath(
      {required String collection, required String documentId});
}

class FirestoreClient implements IFirestoreClient {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreClient(this._firebaseFirestore);

  @override
  Stream<List<Map<String, dynamic>>> listenCollection(String collectionName) =>
      _firebaseFirestore.collection(collectionName).snapshots().map(
          (snapshot) =>
              snapshot.docs.map((document) => document.data()).toList());

  @override
  Stream<Map<String, dynamic>> listenDoc(
          {required String collectionName, required String documentName}) =>
      _firebaseFirestore
          .collection(collectionName)
          .doc(documentName)
          .snapshots()
          .map((snapshot) => snapshot.data() ?? {});

  @override
  Future<List<Map<String, dynamic>>> getCollection(
      String collectionName) async {
    final snapshots = await _firebaseFirestore.collection(collectionName).get();
    final data = snapshots.docs.map((document) => document.data()).toList();
    return data;
  }

  @override
  Future<Map<String, dynamic>> getDoc(
      {required String collectionName, required String documentName}) async {
    final snapshot = await _firebaseFirestore
        .collection(collectionName)
        .doc(documentName)
        .get();
    final data = snapshot.data();
    if (data == null) {
      return Future.error("No Snapshot data");
    }
    return data;
  }

  @override
  Future createDoc(
      {required String collectionName,
      String? documentId,
      required Map<String, dynamic> data}) async {
    final DocumentReference ref;
    if (documentId != null) {
      ref = _firebaseFirestore.collection(collectionName).doc(documentId);
    } else {
      ref = _firebaseFirestore.collection(collectionName).doc();
    }
    ref.set(data);
  }

  @override
  Future updateDocWithReference(
      {required DocumentReference reference,
      required Map<String, dynamic> data}) async {
    reference.set(data, SetOptions(merge: true));
  }

  @override
  Future updateDocWithPath(
      {required String collection,
      required String documentId,
      required Map<String, dynamic> data}) async {
    final reference = _firebaseFirestore.collection(collection).doc(documentId);
    await updateDocWithReference(reference: reference, data: data);
  }

  @override
  Future deleteDocWithReference(DocumentReference reference) async {
    reference.delete();
  }

  @override
  Future deleteDocWithPath(
      {required String collection, required String documentId}) async {
    final reference = _firebaseFirestore.collection(collection).doc(documentId);
    await deleteDocWithReference(reference);
  }
}
