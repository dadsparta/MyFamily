import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myfamily/data/models/desire.dart';
import 'package:myfamily/data/services/desire_service.dart';



class DesiresController extends GetxController {

  String titleOfDesire = '';
  String descriptionOfDesire = '';
  String creator = '';
  String imagePath = '';

  Rx<List<Desire>?> listOfAllDesires = Rx<List<Desire>?>([]);
  Rx<List<Desire>?> listOfMaleDesires = Rx<List<Desire>?>([]);
  Rx<List<Desire>?> listOfFemaleDesires = Rx<List<Desire>?>([]);
  Rx<List<Desire>?> listOfOurDesires = Rx<List<Desire>?>([]);

  @override
  void onInit() {
    super.onInit();
    getListsOfDesires();
  }

  Future<void> getListsOfDesires() async {
    listOfAllDesires.value = await DesireService(FirebaseFirestore.instance).getAllDesires();
  }

  // Future<void> addDesire(Rx<XFile?> image) async {
  //   if (titleOfDesire != '' &&
  //       descriptionOfDesire != '' &&
  //       creator != '' &&
  //       image.value != null) {
  //     FirebaseStorageService firebaseStorageService = FirebaseStorageService(firebaseStorage: FirebaseStorage.instance);
  //     await firebaseStorageService.sendImage(image.value);
  //     String imagePath = firebaseStorageService.imageLink;
  //     if (imagePath != "null") {
  //       await MainServices().addDesire(Desire(
  //           title: titleOfDesire,
  //           description: descriptionOfDesire,
  //           creator: creator,
  //           imagePath: imagePath));
  //     }
  //   }
  //   getListsOfDesires();
  //   update();
  // }



  void deleteDesire(String imageUrl, String id){
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
