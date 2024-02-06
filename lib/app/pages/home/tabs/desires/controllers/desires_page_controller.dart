import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/core/consts/colors.dart';

class DesiresController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  Rx<XFile?> image = Rx<XFile?>(null);

  Future getImageFromGallery() async {
    final simage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (simage != null) {
      image.value = simage;
    } else {
      print('no image selected.');
    }
    update();
  }

  Widget getImage() {
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
