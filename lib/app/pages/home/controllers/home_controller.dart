import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final PageController pageController = PageController();
  final selectedPageIndex = 0.obs;

  void onSelectPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }
}