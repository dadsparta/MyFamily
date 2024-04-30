import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/app/data/models/desire.dart';
import 'package:myfamily/app/data/services/desire_service.dart';
import 'package:myfamily/core/values/gender_types.dart';



class DesiresController extends GetxController {

  late StreamController desiresStream;
  String titleOfDesire = '';
  String descriptionOfDesire = '';
  GenderTypes creator = GenderTypes.first;
  String imagePath = '';

  Rx<List<Desire>?> listOfAllDesires = Rx<List<Desire>?>([]);

  @override
  void onInit() {
    super.onInit();
    getListsOfDesires();
  }

  Future<void> getListsOfDesires() async {
    listOfAllDesires.value = await DesireService(FirebaseFirestore.instance).getAllDesires();
    update();
  }

  RxList<Desire> sortAndFilterDesires(GenderTypes desiredType) {
    while (listOfAllDesires.value == null) {
      return RxList<Desire>();
    }

    List<Desire> filteredList = listOfAllDesires.value!
        .where((desire) => desire.creator == desiredType)
        .toList();

    filteredList.sort((a, b) => a.creator.toString().compareTo(b.creator.toString()));

    return RxList<Desire>(filteredList);
  }


  Future<void> onAddDesire(Rx<XFile?> image) async{
    await DesireService(FirebaseFirestore.instance).addDesire(image, titleOfDesire, descriptionOfDesire, creator);
    getListsOfDesires();
    update();
  }

  void onDeleteDesire(String imageUrl, String id){
    if (imageUrl.isNotEmpty && imageUrl != '') {
      DesireService(FirebaseFirestore.instance).deleteDesireWithImage(id, imageUrl);
    }
    else{
      DesireService(FirebaseFirestore.instance).deleteDesire(id);
    }
    getListsOfDesires();
    update();
  }
}
