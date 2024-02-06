import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/core/consts/colors.dart';

class DesireDetailController extends GetxController{
  late final Map<String, dynamic> args;
  late final String text;
  late final String gender;
  late final Color cardColor;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments;
    text = args['text'];
    gender = args['gender'];
    cardColor = args['cardColor'];
  }
}
