import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/data/models/desire.dart';
import 'package:myfamily/app/routes/app_pages.dart';
import 'package:myfamily/core/theme/app_colors.dart';
import 'package:myfamily/core/theme/texts.dart';
import 'package:myfamily/core/values/gender_types.dart';

class DesireTile extends StatelessWidget {
  final Rx<Desire> desire;
  final Function function;

  late final Color cardColor;
  RxBool isTyped = false.obs;

  DesireTile({super.key, required this.desire, required this.function}) {
    switch (desire.value.creator) {
      case GenderTypes.first:
        cardColor = AppColors.maleColor;
      case GenderTypes.second:
        cardColor = AppColors.togetherColor;
      case GenderTypes.third:
        cardColor = AppColors.femaleColor;
      default:
        cardColor = AppColors.togetherColor;
    }
  }

  void checkboxValueUpdate(bool? value) {
    isTyped.value = value!;
  }

  void goToDetailPage() {
    Get.toNamed(
      Routes.desireDetail,
      arguments: {
        'desire': desire,
        'cardColor' : cardColor
      },
    );
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
                    function();
                  }
                },
              ),
            ),
            Expanded(
              child: AppText.desireSampleText(desire.value.title),
            ),
          ],
        ),
      ),
    );
  }
}
