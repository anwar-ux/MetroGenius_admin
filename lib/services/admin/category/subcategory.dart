import 'package:cloud_firestore/cloud_firestore.dart';

class Subcategory {
  static Future<bool> addSubcategory(String categoryId, Map<String, dynamic> subcategoryInfo, String subcategoryId) async {
    try {
      DocumentReference categoryDoc = FirebaseFirestore.instance.collection('Categorys').doc(categoryId);
      await categoryDoc.collection('subcategories').doc(subcategoryId).set(subcategoryInfo);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Map<String, dynamic> subCategoryInfo({
    required String id,
    required String name,
    required String image,
    required String discription,
    required int price,
    required Map<String, bool> checkboxes,

  }) {
    Map<String, dynamic> employeeAplicationInfo = {
      'Id': id,
      'Name': name,
      'Image': image,
      'Discription': discription,
      'Price': price,
      'Checkboxes':checkboxes,
    };
    return employeeAplicationInfo;
  }

  static Future<Stream<QuerySnapshot>> getSubcategories(String categoryId) async {
    return FirebaseFirestore.instance.collection("Categorys").doc(categoryId).collection("subcategories").snapshots();
  }
}
