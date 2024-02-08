import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:myfamily/core/services/firebase_storage_service.dart';
import 'package:myfamily/core/services/firestore_controller.dart';

import '../../data/models/desire.dart';


class MainServices {
  FirebaseStorageService firebaseStorageService =
  FirebaseStorageService(firebaseStorage: FirebaseStorage.instance);

  FirestoreController firestoreController = Get.find();

  late final CollectionReference generalCollection =
  firestoreController.firestore.collection('General');

  Future<List<Desire>?> getAllDesires() async {
    var snapshot = await firestoreController.firestore.collection('General').get();
    var docs = snapshot.docs.map((e) => Desire.fromJson(e.data())).toList();
    return docs;
  }

  Future<List<Desire>?> getMaleDesires() async {
    var snapshot = await firestoreController.firestore.collection('General').where('creator', isEqualTo: 'male').get();
    var docs = snapshot.docs.map((e) => Desire.fromJson(e.data())).toList();
    return docs;
  }

  Future<List<Desire>?> getFemaleDesires() async {
    var snapshot = await firestoreController.firestore.collection('General').where('creator', isEqualTo: 'female').get();
    var docs = snapshot.docs.map((e) => Desire.fromJson(e.data())).toList();
    return docs;
  }

  Future<List<Desire>?> getOurDesires() async {
    var snapshot = await firestoreController.firestore.collection('General').where('creator', isEqualTo: 'Own').get();
    var docs = snapshot.docs.map((e) => Desire.fromJson(e.data())).toList();
    return docs;
  }

  Future<void> addDesire(Desire desire) async {
    var doc = await generalCollection.add(desire.toJson());
    desire.id = doc.id;
    doc.update(desire.toJson());
  }

  Future<void> deleteDesire(String id) async {
    firestoreController.firestore.collection('General').doc(id).delete();
  }

  Future<void> deleteDesireWithImage(String id, String refOfImage) async {
    firestoreController.firestore.collection('General').doc(id).delete();

    var firebaseStorageRef =
        firebaseStorageService.firebaseStorage.refFromURL(refOfImage);
    try {
      await firebaseStorageRef.delete();
    } catch (error) {
      print(error);
    }
  }
}
