import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/models/desire.dart';
import '../../utilities/services/main_services.dart';

class MainPageModel {
  MainPageModel({required this.firestore, required this.state});

  final FirebaseFirestore firestore;
  final State state;
  late MainServices mainService = MainServices(firestore: firestore);

  void initState() {
    mainService = MainServices(firestore: firestore);
  }

  Future<void> addDesire(title, description) async {
    Desire desire = Desire(title: title, description: description);
    return mainService.addDesire(desire);
  }

  int getCountOfDesires(){
    mainService.getCountOfDesire();
    return mainService.sizeOfCollection;
  }
}