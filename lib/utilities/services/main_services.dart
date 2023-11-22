import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/desire.dart';


class MainServices {

  final FirebaseFirestore firestore;

  late final CollectionReference generalCollection = firestore.collection(
      'General');
  int sizeOfCollection = 0;

  MainServices({required this.firestore});

  Future<List<Desire>?> getDesires() async {
    var snapshot = await firestore.collection('General').get();
    var docs = snapshot.docs.map((e) => Desire.fromJson(e.data())).toList();
    return docs;
  }

  Future<int> getCountOfDesire() async {
    QuerySnapshot querySnapshot = await generalCollection.get();
    return querySnapshot.size;
  }

  Future<void> addDesire(Desire desire) async {
    var doc = await generalCollection.add(desire.toJson());
    desire.id = doc.id;
    doc.update(desire.toJson());
  }

}