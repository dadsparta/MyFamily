import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/routes/app_pages.dart';
import 'package:myfamily/core/consts/colors.dart';
import 'package:myfamily/core/consts/texts.dart';
import 'package:myfamily/data/models/desire.dart';

class DesireTile extends StatelessWidget {
  final Desire desire;

  late final RxString title = desire.title.obs;
  late final RxString description = desire.description.obs;
  late final RxString imageUrl = desire.imagePath.obs;
  late final RxString gender = desire.creator.obs;

  late final Color cardColor;
  RxBool isTyped = false.obs;

  DesireTile({super.key, required this.desire}) {
    switch (gender.value) {
      case 'male':
        cardColor = AppColors.maleColor;
      case 'Our':
        cardColor = AppColors.togetherColor;
      case 'female':
        cardColor = AppColors.femaleColor;
      default:
        cardColor = AppColors.togetherColor;
    }
  }

  void checkboxValueUpdate(bool? value) {
    isTyped.value = value!;
  }

  void goToDetailPage() {
    Get.toNamed(Routes.desireDetail, arguments: {
      'title': title,
      'cardColor': cardColor,
      'description': description,
      'imageURL': imageUrl
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToDetailPage(),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: cardColor,
        ),
        child: Row(
          children: [
            Obx(
              () => Checkbox(
                value: isTyped.value,
                onChanged: (value) {
                  checkboxValueUpdate(value);
                  if (value == true) {


                  }
                },
              ),
            ),
            Expanded(
              child: DesireSampleText(text: title.value),
            ),
          ],
        ),
      ),
    );
  }
}
