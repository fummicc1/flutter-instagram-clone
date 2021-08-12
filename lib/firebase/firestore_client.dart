import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {
  final FirebaseFirestore _firebaseFirestore;

  FirestoreClient(this._firebaseFirestore);

  Stream<List<Map<String, dynamic>>> listenCollection(String collectionName) =>
      _firebaseFirestore.collection(collectionName).snapshots().map(
          (snapshot) =>
              snapshot.docs.map((document) => document.data()).toList());

  Stream<Map<String, dynamic>> listenDoc(
          {required String collectionName, required String documentName}) =>
      _firebaseFirestore
          .collection(collectionName)
          .doc(documentName)
          .snapshots()
          .map((snapshot) => snapshot.data() ?? {});

  Future<List<Map<String, dynamic>>> getCollection(
      String collectionName) async {
    final snapshots = await _firebaseFirestore.collection(collectionName).get();
    final data = snapshots.docs.map((document) => document.data()).toList();
    return data;
  }

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

  Future updateDocWithReference(
      {required DocumentReference reference,
      required Map<String, dynamic> data}) async {
    reference.set(data, SetOptions(merge: true));
  }

  Future updateDocWithPath(
      {required String collection,
      required String documentId,
      required Map<String, dynamic> data}) async {
    final reference = _firebaseFirestore.collection(collection).doc(documentId);
    await updateDocWithReference(reference: reference, data: data);
  }

  Future deleteDocWithReference(DocumentReference reference) async {
    reference.delete();
  }

  Future deleteDocWithPath(
      {required String collection, required String documentId}) async {
    final reference = _firebaseFirestore.collection(collection).doc(documentId);
    await deleteDocWithReference(reference);
  }
}
