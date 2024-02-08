import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/core/consts/colors.dart';
import 'package:myfamily/core/services/main_services.dart';

import '../../../../../../data/models/desire.dart';

class DesiresController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  Rx<XFile?> image = Rx<XFile?>(null);

  TextEditingController titleDesireController = TextEditingController();
  TextEditingController descriptionDesireController = TextEditingController();
  String creator = 'Our';
  String imagePath = '';

  Rx<List<Desire>?> listOfAllDiseres = Rx<List<Desire>?>([]);
  Rx<List<Desire>?> listOfMaleDiseres = Rx<List<Desire>?>([]);
  Rx<List<Desire>?> listOfFemaleDiseres = Rx<List<Desire>?>([]);
  Rx<List<Desire>?> listOfOurDiseres = Rx<List<Desire>?>([]);

  @override
  void onInit() {
    super.onInit();
    getlistsOfDesires();
  }

  Future<void> getlistsOfDesires() async {
    listOfAllDiseres.value = await MainServices().getAllDesires();
    listOfMaleDiseres.value = await MainServices().getMaleDesires();
    listOfFemaleDiseres.value = await MainServices().getFemaleDesires();
    listOfOurDiseres.value = await MainServices().getOurDesires();
  }

  Future<void> addDesire() async {
    if (titleDesireController.text.isNotEmpty &&
        descriptionDesireController.text.isNotEmpty &&
        creator.isNotEmpty &&
        imagePath.isNotEmpty) {
      await MainServices().addDesire(Desire(
          title: titleDesireController.text,
          description: descriptionDesireController.text,
          creator: creator,
          imagePath: imagePath));
    }
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
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
