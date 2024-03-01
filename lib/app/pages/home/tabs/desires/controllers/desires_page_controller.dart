import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/core/values/gender_types.dart';
import 'package:myfamily/data/models/desire.dart';
import 'package:myfamily/data/services/desire_service.dart';



class DesiresController extends GetxController {

  String titleOfDesire = '';
  String descriptionOfDesire = '';
  GenderTypes creator = GenderTypes.Our;
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
    sortingOfAllDesires();
  }

  void sortingOfAllDesires(){
    clearSortingLists();
    listOfAllDesires.value?.forEach((desire) {
      if (desire.creator == GenderTypes.male) {
        listOfMaleDesires.value?.add(desire);
      } else if (desire.creator == GenderTypes.female) {
        listOfFemaleDesires.value?.add(desire);
      } else if (desire.creator == GenderTypes.Our) {
        listOfOurDesires.value?.add(desire);
      }
      else{
        listOfOurDesires.value?.add(desire);
      }
    });
  }
  void clearSortingLists() {
    listOfMaleDesires.value?.clear();
    listOfFemaleDesires.value?.clear();
    listOfOurDesires.value?.clear();
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
