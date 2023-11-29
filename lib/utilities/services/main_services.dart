import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:myfamily/utilities/services/firebase_storage_service.dart';

import '../../data/models/desire.dart';

class MainServices {
  final FirebaseFirestore firestore;

  late final CollectionReference generalCollection =
      firestore.collection('General');

  late List<Desire> ListOfDiseres = [
    Desire(
        title: "загрузка",
        description: "загрузка",
        creator: "own",
        imagePath: "null",
        imageId: "null"),
  ];

  MainServices({required this.firestore});

  Future<List<Desire>?> getDesires() async {
    var snapshot = await firestore.collection('General').get();
    var docs = snapshot.docs.map((e) => Desire.fromJson(e.data())).toList();
    ListOfDiseres = docs;
    return docs;
  }

  Future<void> addDesire(Desire desire) async {
    var doc = await generalCollection.add(desire.toJson());
    desire.id = doc.id;
    doc.update(desire.toJson());
  }

  Future<void> deleteDesire(String id) async {
    firestore.collection('General').doc(id).delete();
    FirebaseStorageService firebaseStorageService =
        FirebaseStorageService(firebaseStorage: FirebaseStorage.instance);
  }

  Future<void> deleteDesireWithImage(String id, String refOfImage) async {
    firestore.collection('General').doc(id).delete();
    FirebaseStorageService firebaseStorageService =
    FirebaseStorageService(firebaseStorage: FirebaseStorage.instance);
    var firebaseStorageRef = firebaseStorageService.firebaseStorage.refFromURL(refOfImage);
    try{
      await firebaseStorageRef.delete();
    }
    catch(error){
      print(error);
    }
  }
}
