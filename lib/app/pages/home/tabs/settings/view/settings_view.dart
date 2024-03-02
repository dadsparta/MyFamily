import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/pages/home/tabs/settings/controller/settings_controller.dart';
import 'package:myfamily/core/theme/app_colors.dart';
import 'package:myfamily/core/theme/texts.dart';
import 'package:myfamily/core/values/languages.dart';
import 'package:myfamily/generated/locales.g.dart';

class Settings extends GetView<SettingsController> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: AppText.title(LocaleKeys.settings.tr),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.togetherColor,
            ),
            child: Obx(
              () => DropdownButton<String>(
                value: controller.selectedLanguage.value,
                elevation: 16,
                borderRadius: BorderRadius.circular(16),
                onChanged: controller.setLanguage,
                dropdownColor: AppColors.addPanelColor,
                underline: Container(),
                items: AppValues.locales
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14,0,14,0),
                      child: AppText.tegText(value.tr),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
