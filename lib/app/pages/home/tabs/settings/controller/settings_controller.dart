import 'dart:ui';

import 'package:get/get.dart';
import 'package:myfamily/generated/locales.g.dart';

class SettingsController extends GetxController{
  final selectedLanguage = LocaleKeys.en.obs;

  void setLanguage(String? language) async {
    selectedLanguage.value = language ?? LocaleKeys.en;
    await Get.updateLocale(Locale(selectedLanguage.value));
  }
}