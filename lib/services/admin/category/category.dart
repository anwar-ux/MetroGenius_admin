import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryAdmin{

static Future<bool> addCategory(categoryInfo,id) async {
    try {
     
      await FirebaseFirestore.instance
          .collection("Categorys")
          .doc(id)
          .set(categoryInfo);
      return true;
    } catch (e) {
      return false;
    }
  }

  static  Map<String, dynamic> categoryInfo({
    required String id,
    required String name,
    required String image,
  }) {
    Map<String, dynamic> employeeAplicationInfo = {
      'Id':id,
      'Name': name,
      'Image': image,
    };
    return employeeAplicationInfo;
  }
   static Future<Stream<QuerySnapshot>> getCategorys() async {
    return FirebaseFirestore.instance
        .collection("Categorys")
        .snapshots();
  }
}