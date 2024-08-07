import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:http/http.dart' as http;

class Applications {
  static Future<Stream<QuerySnapshot>> getEmployeeApplicatons() async {
    return FirebaseFirestore.instance.collection("EmployeeAplications").snapshots();
  }

  static Future<bool> deleteCategory(String id) async {
    try {
      await FirebaseFirestore.instance.collection("EmployeeAplications").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Map<String, dynamic> employeeAplicationInfo(DocumentSnapshot<Object?> data, String id) {
    Map<String, dynamic> employeeAplicationInfo = {
      'Id': data['Id'],
      'Email': data['Email'],
      'Name': data['Name'],
      'Phone': data['Phone'],
      'IDproof': data['IDproof'],
      'Experience': data['Experience'],
      'Work': data['Work'],
      'Image': data['Image'],
      'EmployeeCode': id
    };
    return employeeAplicationInfo;
  }

static Future<bool> addEmployee(Map<String, dynamic> employeeAplicationInfo, String id) async {
  try {
    await FirebaseFirestore.instance
        .collection("Workers")
        .doc(id)
        .set(employeeAplicationInfo);

    await FirebaseFirestore.instance
        .collection("EmployeeAplications")
        .doc(id)
        .delete();

    return true;
  } catch (e) {
    print('Error in addEmployee: $e');
    return false;
  }
}

static Future<void> sendWelcomeEmail(String email, String employeeCode) async {
  final url = Uri.https('your-project-id.cloudfunctions.net', '/sendWelcomeEmail');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'employeeCode': employeeCode,
      }),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully: ${response.body}');
    } else {
      print('Failed to send email: ${response.body}');
    }
  } catch (e) {
    print('Error sending email: $e');
  }
}

  static Future<bool> sendEmail(String recipientEmail, String employeeCode) async {
    print('gii');
  

    final smtpServer = yandex('anwarcr7432@gmail.com','ynwgwyjwvntdiwrb');

    final message = Message()
      ..from = Address('anwarcr7432@gmail.com', 'Your Company')
      ..recipients.add(recipientEmail)
      ..subject = 'Welcome to the Company'
      ..text = 'Your employee code is $employeeCode'
      ..html = '<p>Your employee code is <b>$employeeCode</b></p>';

    try {
      final sendReport = await send(message, smtpServer);

      print('Message sent: ${sendReport.toString()}');
      return true;
    } catch (e) {
      print('Error occurred while sending email: $e');
      return false;
    }
  }
}
