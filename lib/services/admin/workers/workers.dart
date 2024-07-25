import 'package:cloud_firestore/cloud_firestore.dart';

class Workers{
  static Future<Stream<QuerySnapshot>> getWorkers() async {
    return FirebaseFirestore.instance
        .collection("Workers")
        .snapshots();
  }
}