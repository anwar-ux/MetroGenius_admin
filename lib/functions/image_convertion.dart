import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
 import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;


class  ImageConvertion {
 static Future<String?> pickImageWeb() async {
    final completer = Completer<String?>();

    final input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.onChange.listen((e) async {
      final files = input.files;
      if (files!.isEmpty) {
        completer.complete(null);
        return;
      }
      final reader = html.FileReader();
      reader.onLoadEnd.listen((e) {
        final base64String = reader.result as String?;
        if (base64String != null) {
          final base64Data = base64String.split(',').last; 
          completer.complete(base64Data);
        } else {
          completer.complete(null);
        }
      });
      reader.readAsDataUrl(files[0]);
    });

    input.click();
    return completer.future;
}



static Future<String?> uploadImageToFirebase(String base64Image) async {
  try {
    // Decode the base64 string
    Uint8List imageBytes = base64Decode(base64Image);

    // Generate a unique file name
    String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.png';
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');

    // Create an UploadTask with the decoded bytes
    UploadTask uploadTask = firebaseStorageRef.putData(imageBytes);

    // Listen for upload progress
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      print('Upload is ${snapshot.bytesTransferred}/${snapshot.totalBytes} (${(snapshot.bytesTransferred / snapshot.totalBytes * 100).toStringAsFixed(0)}%)');
    });

    TaskSnapshot taskSnapshot = await uploadTask;

    // Get the download URL
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}

}

  