import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService{

  FirebaseStorageService({required this.firebaseStorage});
  final FirebaseStorage firebaseStorage;

  String imageLink = "null";

  Future<void> sendImage(XFile? _image) async {
    String uniqueFileName = "${DateTime
        .now()
        .millisecondsSinceEpoch}.jpg";

    Reference referenceToUpload = firebaseStorage.ref().child('desires').child(uniqueFileName);

    try {
      await referenceToUpload.putFile(File(_image!.path));
      imageLink = await referenceToUpload.getDownloadURL();
      return;
    } catch (error) {
      print(error);
    }

    referenceToUpload.putFile(File(_image!.path));
    imageLink = "null";
  }


}