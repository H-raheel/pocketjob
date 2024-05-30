import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pocketjob/models/applications.dart';

class ApplicationsRepo {
  UploadTask? upload;
  final CollectionReference applications =
      FirebaseFirestore.instance.collection('Applications');
  Future<String> uploadFile(PlatformFile pickedFile) async {
    final firebasePath = 'files/${pickedFile.name}'; // 'files/fileName'
    final file = File(pickedFile.path!);

    final ref = FirebaseStorage.instance.ref().child(firebasePath);
    upload = ref.putFile(file);
    final snapshot = await upload!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print(urlDownload);
    return urlDownload; // Return the download URL
  }

  Future<String> saveApplication(
      ApplicationModel application, PlatformFile file) async {
    String url = await uploadFile(file);
    application = application.copyWith(
        pdfUrl: url); // Update the application with the PDF URL
    try {
      final applicationJson = application.toJson();
      await applications.add(applicationJson);
      print("doone");
      return 'Success';
    } catch (e) {
      throw Exception('Failed to save application: $e');
    }
  }
}
