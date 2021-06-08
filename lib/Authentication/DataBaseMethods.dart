import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future<String> addToFireStoreDocId(
      String collectionName, String docId, Map<String, dynamic> dataMap) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(docId)
          .set(dataMap);
    } catch (e) {
      print(e);
    }
  }
}
