import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_page_controller.dart';
import 'package:myfamily/core/theme/app_colors.dart';
import 'package:myfamily/core/theme/texts.dart';
import 'package:myfamily/core/values/gender_types.dart';
import 'package:myfamily/data/extantion/gender_type_translater.dart';
import 'package:myfamily/generated/locales.g.dart';

class AddDesiresBottomSheet extends GetView<DesiresController> {
  final _activeTag = GenderTypes.Our.obs;
  final ImagePicker imagePicker = ImagePicker();
  Rx<XFile?> image = Rx<XFile?>(null);
  AddDesiresBottomSheet({super.key});

  void removeImageFromPicker() {
    image.value = null;
    image.refresh();
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
                  color: AppColors.addPanelColor,
                  iconSize: 32,
                  onPressed: () {
                    removeImageFromPicker();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.cardColor,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  void addDesireFunction() {
    controller.creator = _activeTag.value;
    controller.titleOfDesire = titleController.text;
    controller.descriptionOfDesire = descriptionController.text;
    controller.onAddDesire(image);
    titleController.text = '';
    descriptionController.text = '';
    removeImageFromPicker();
    _activeTag.value = GenderTypes.Our;
    Get.back();
  }

  Future getImageFromGallery() async {
    final simage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (simage != null) {
      image.value = simage;
    } else {
      print('no image selected.');
    }
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            SafeArea(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                children: [
                  AppText.title(LocaleKeys.create_desire.tr),
                  const SizedBox(
                    height: 20,
                  ),
                  getImage(),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: GenderTypes.values.map((tag) {
                        return GestureDetector(
                          onTap: () => _activeTag.value = tag,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            decoration: BoxDecoration(
                              color: _activeTag.value == tag
                                  ? AppColors.cardColor
                                  : AppColors.togetherColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(tag.translate()),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: titleController,
                    decoration:  InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      label: Text(
                        LocaleKeys.input_desire_title.tr,
                        style: const TextStyle(color: AppColors.textColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      label: Text(
                        LocaleKeys.input_desire_description.tr,
                        style: const TextStyle(color: AppColors.textColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        addDesireFunction();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.firstColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            barrierColor: Colors.transparent,
            backgroundColor: AppColors.secondColor,
            isDismissible: true,
          );
        },
        backgroundColor: AppColors.secondColor,
        child: const Icon(
          Icons.add,
          color: AppColors.firstColor,
        ),
      ),
    );
  }
}
