import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/core/consts/colors.dart';
import 'package:myfamily/core/services/firebase_storage_service.dart';
import 'package:myfamily/core/services/main_services.dart';

import '../../../../../../data/models/desire.dart';

class DesiresController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  Rx<XFile?> image = Rx<XFile?>(null);

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
    listOfAllDesires.value = await MainServices().getAllDesires();
    listOfMaleDesires.value = await MainServices().getMaleDesires();
    listOfFemaleDesires.value = await MainServices().getFemaleDesires();
    listOfOurDesires.value = await MainServices().getOurDesires();
  }

  Future<void> addDesire() async {
    if (titleOfDesire != '' &&
        descriptionOfDesire != '' &&
        creator != '' &&
        image.value != null) {
      FirebaseStorageService firebaseStorageService = FirebaseStorageService(firebaseStorage: FirebaseStorage.instance);
      await firebaseStorageService.sendImage(image.value);
      String imagePath = firebaseStorageService.imageLink;
      if (imagePath != "null") {
        await MainServices().addDesire(Desire(
            title: titleOfDesire,
            description: descriptionOfDesire,
            creator: creator,
            imagePath: imagePath));
      }
    }
    getListsOfDesires();
    update();
  }

  Future getImageFromGallery() async {
    final simage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (simage != null) {
      image.value = simage;
    } else {
      print('no image selected.');
    }
    update();
  }

  void deleteDesire(RxString imageUrl, RxString id){
    if (imageUrl.isNotEmpty && imageUrl != '') {
      MainServices().deleteDesireWithImage(id.value, imageUrl.value);
    }
    else{
      MainServices().deleteDesire(id.value);
    }
    getListsOfDesires();
    update();
  }

  void deleteImage(){
    image.value = null;
    update();
  }

  Widget getImage(){
    return Obx(() {
      if (image.value == null) {
        return IconButton(
          onPressed: () {
            getImageFromGallery();
          },
          color: AppColors.firstColor,
          icon: const Icon(Icons.photo),
        );
      } else {
        return Center(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                height: 300,
                child: GestureDetector(
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: Image.file(
                    File(image.value!.path),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  color: AppColors.addPanelColor,
                  iconSize: 32,
                  onPressed: () {
                    deleteImage();
                  },
                  icon: const Icon(Icons.delete, color: AppColors.cardColor,),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
