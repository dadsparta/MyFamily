import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService extends GetxService{

 String imageLink = "null";

  FirebaseStorageService({required this.firebaseStorage});
  final FirebaseStorage firebaseStorage;

  Future<void> sendImage(XFile? image) async {
    String uniqueFileName = "${DateTime
        .now()
        .millisecondsSinceEpoch}.jpg";
    Reference referenceToUpload = firebaseStorage.ref().child('desires').child(uniqueFileName);
    try {
      await referenceToUpload.putFile(File(image!.path));
      imageLink = await referenceToUpload.getDownloadURL();
      return;
    } catch (error) {
      print(error);
    }
    referenceToUpload.putFile(File(image!.path));
    imageLink = "null";
  }

}