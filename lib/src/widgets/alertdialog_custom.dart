import 'package:flutter/material.dart';

Future<dynamic> alertDialogCustom(
 {required BuildContext context,
  required String title,
  required String message,
  String? firstButtonText,
  String? secondButtonText,
  void Function()? firstButtonAction,
  void Function()? secondButtonAction,}
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: firstButtonAction,
            child:Text(firstButtonText??''),
          ),
          TextButton(
            child:  Text(secondButtonText??''),
            onPressed:secondButtonAction,
          ),
        ],
      );
    },
  );
}
