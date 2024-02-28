import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesireDetailController extends GetxController{
  late final Map<String, dynamic> args;
  late final RxString title;
  late final RxString description;
  late final RxString imageURL;
  late final Color cardColor;


  @override
  void onInit() {
    super.onInit();
    args = Get.arguments;
    title = args['title'];
    cardColor = args['cardColor'];
    description = args['description'];
    imageURL = args['imageURL'];
    print(imageURL);

  }

}
