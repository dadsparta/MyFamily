import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_tile_controller.dart';
import 'package:myfamily/core/consts/texts.dart';

class DesireTile extends StatelessWidget {
  final DesiresTileController controller =
      DesiresTileController(text: 's'.obs, gender: 'female'.obs);

  DesireTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToDetailPage(),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: controller.cardColor,
        ),
        child: Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.isTyped.value,
                onChanged: (value) {
                  controller.checkboxValueUpdate(value);
                },
              ),
            ),
            Expanded(
              child: DesireSampleText(text: controller.text.value),
            ),
          ],
        ),
      ),
    );
  }
}
