import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Applications {
  static Future<Stream<QuerySnapshot>> getEmployeeApplicatons() async {
    return FirebaseFirestore.instance
        .collection("EmployeeAplications")
        .snapshots();
  }

  static Future<bool> deleteCategory(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("EmployeeAplications")
          .doc(id)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Map<String, dynamic> employeeAplicationInfo(
      DocumentSnapshot<Object?> data) {
    Map<String, dynamic> employeeAplicationInfo = {
      'Id': data['Id'],
      'Email': data['Email'],
      'Name': data['Name'],
      'Phone': data['Phone'],
      'IDproof': data['IDproof'],
      'Experience': data['Experience'],
      'Work': data['Work'],
      'Image': data['Image'],
    };
    return employeeAplicationInfo;
  }

  static Future<bool> addEmployee(employeeAplicationInfo, id) async {
    try {
       FirebaseFirestore.instance
          .collection("Workers")
          .doc(id)
          .set(employeeAplicationInfo)
          .then(FirebaseFirestore.instance
              .collection("EmployeeAplications")
              .doc(id)
              .delete() as FutureOr Function(void value));
      return true;
    } catch (e) {
      return false;
    }
  }
}
