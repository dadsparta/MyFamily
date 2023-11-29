import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/models/desire.dart';
import '../../utilities/samples/desire_tiles/desire_tile.dart';
import '../../utilities/samples/desire_tiles/desire_tile_female.dart';
import '../../utilities/samples/desire_tiles/desire_tile_man.dart';
import '../../utilities/samples/desire_tiles/desire_tile_own.dart';
import '../../utilities/services/main_services.dart';

class MainPageModel {
  MainPageModel({required this.firestore, required this.state});

  static bool isOwnActive = false;
  static bool isManActive = false;
  static bool isWomanActive = false;
  final FirebaseFirestore firestore;

  final State state;

  late MainServices mainService = MainServices(firestore: firestore);

  void initState() {
    mainService = MainServices(firestore: firestore);
    mainService.getDesires();
  }

  Future<void> addDesire(String title, String description, String creator,
      String imagePath, String imageId) async {
    if (title.isNotEmpty && description.isNotEmpty) {
      Desire desire = Desire(
          title: title,
          description: description,
          creator: creator,
          imagePath: imagePath,
          imageId: imageId);
      mainService.addDesire(desire);
    }
  }

  Widget? generatorOfDesire(
    int index,
    State state,
  ) {
    if (isOwnActive == true) {
      return DesireOwnSample(
        text: '1',
        instance: firestore,
        index: index,
        state: state,
      );
    }
    if (isManActive == true) {
      return DesireManSample(
        text: '1',
        instance: firestore,
        index: index,
        state: state,
      );
    }
    if (isWomanActive == true) {
      return DesireWomanSample(
        text: '1',
        instance: firestore,
        index: index,
        state: state,
      );
    } else {
      return DesireSample(
        text: '1',
        instance: firestore,
        index: index,
        state: state,
      );
    }
  }
}
