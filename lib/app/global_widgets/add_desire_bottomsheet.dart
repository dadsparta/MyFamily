import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_page_controller.dart';
import 'package:myfamily/core/consts/texts.dart';

import '../../core/consts/colors.dart';

class AddDesiresButtomsheet extends StatelessWidget {
  DesiresController controller;

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
                  SizedBox(
                    height: 20,
                  ),
                  controller.getImage(),
                  SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    decoration: InputDecoration(
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
                  SizedBox(
                    height: 20,
                  ),
                  const TextField(
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
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: AppColors.firstColor,
                      ),
                    ),
                  ),
                  SizedBox(
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
