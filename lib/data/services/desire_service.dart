import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:myfamily/data/models/desire.dart';
import 'package:myfamily/data/services/firebase_storage_service.dart';

class DesireService extends GetxService{
  FirebaseStorageService firebaseStorageService =
  FirebaseStorageService(firebaseStorage: FirebaseStorage.instance);
  final FirebaseFirestore firestore;
  late CollectionReference collection;

  DesireService(this.firestore) {
    collection = firestore.collection('General');
  }

  Future<List<Desire>?> getAllDesires() async {
    var snapshot = await collection.get();
    var docs = snapshot.docs.map((e) => Desire.fromJson(e.data() as Map<String, dynamic>)).toList();
    return docs;
  }

  Future<void> addDesire(Desire desire) async {
    var doc = await collection.add(desire.toJson());
    desire.id = doc.id;
    doc.update(desire.toJson());
  }

  Future<void> deleteDesire(String id) async {
    collection.doc(id).delete();
  }

  Future<void> deleteDesireWithImage(String id, String refOfImage) async {
    collection.doc(id).delete();

    var firebaseStorageRef =
    firebaseStorageService.firebaseStorage.refFromURL(refOfImage);
    try {
      await firebaseStorageRef.delete();
    } catch (error) {
      print(error);
    }
  }
}