import 'dart:ui';

import 'package:get/get.dart';
import 'package:myfamily/app/routes/app_pages.dart';
import 'package:myfamily/core/consts/colors.dart';

  class DesiresTileController{
    final RxString gender;
    final RxString text;
    late final Color cardColor;

    RxBool isTyped = false.obs;

    DesiresTileController({required this.text, required this.gender}){
      _checkColor();
    }

    void _checkColor(){
      if (gender.value == "female") {
        cardColor = AppColors.femaleColor;
      } else if (gender.value == "male") {
        cardColor = AppColors.maleColor;
      }
      else{
        cardColor = AppColors.togetherColor;
      }
    }

    void checkboxValueUpdate(bool? value){
      isTyped.value = value!;
    }

    void goToDetailPage(){
      Get.toNamed(Routes.desireDetail, arguments: {
        'text': text.value,
        'gender': gender.value,
        'cardColor' : cardColor
      });
    }
  }