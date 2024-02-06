import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/core/consts/texts.dart';

import '../../core/consts/colors.dart';

class AddDesiresButtomsheet extends StatelessWidget {
  const AddDesiresButtomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.bottomSheet(
          SafeArea(
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              children: [
                TitleText(text: 'Create desire'),
                TextField(),
                TextField(),
                ImagePicker(),
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
    );
  }
}
