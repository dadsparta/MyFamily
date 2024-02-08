import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_page_controller.dart';
import 'package:myfamily/core/consts/texts.dart';

import '../../core/consts/colors.dart';

class AddDesiresButtomsheet extends StatelessWidget {
  DesiresController controller;
  List<String> _tags = ['Our', 'Hanna', 'Yan'];
  List<String> genders = ['Own', 'female', 'male'];
  RxString _activeTag = ''.obs;

  void addDesireFunction() {
    if (_activeTag == 'Hanna') {
      controller.creator = 'female';
    } else if (_activeTag == "Yan") {
      controller.creator = 'male';
    } else {
      controller.creator = 'Own';
    }
    controller.titleOfDesire = titleController!.text;
    controller.descriptionOfDesire = descriptionController!.text;
    controller.addDesire();
    Get.back();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  AddDesiresButtomsheet({super.key, required this.controller});

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
                  TitleText(text: 'Create desire'),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.getImage(),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _tags.map((tag) {
                          return GestureDetector(
                            onTap: () {
                              if (_activeTag.value == tag) {
                                _activeTag.value = '';
                              } else {
                                _activeTag.value = tag;
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              decoration: BoxDecoration(
                                color: _activeTag.value == tag
                                    ? AppColors.cardColor
                                    : AppColors.togetherColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(tag),
                            ),
                          );
                        }).toList(),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      label: Text(
                        'Введите название желания',
                        style: TextStyle(color: AppColors.textColor),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      label: Text(
                        'Введите описание желания',
                        style: TextStyle(color: AppColors.textColor),
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
