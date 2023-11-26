import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/models/desire.dart';
import '../../utilities/services/main_services.dart';

class MainPageModel {
  MainPageModel(
      {required this.firestore,
      required this.state});

  final FirebaseFirestore firestore;

  final State state;


  late MainServices mainService = MainServices(firestore: firestore);

  void initState() {
    mainService = MainServices(firestore: firestore);
  }

  Future<void> addDesire(String title,String description, String creator) async {
    if (title.isNotEmpty && description.isNotEmpty) {
      Desire desire = Desire(
        title: title,
        description: description,
        creator: creator
      );
      mainService.addDesire(desire);
    }
  }
}
