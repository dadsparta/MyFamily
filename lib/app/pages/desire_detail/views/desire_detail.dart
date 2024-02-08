import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/pages/desire_detail/controllers/desire_detail_controller.dart';
import 'package:myfamily/core/consts/colors.dart';
import 'package:myfamily/core/consts/texts.dart';

class DesireDetail extends GetView<DesireDetailController> {
  const DesireDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: controller.cardColor),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: AppColors.secondColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            (controller.imageURL.value != null &&
                    controller.imageURL.value.isNotEmpty)
                ? SizedBox(
                    height: 500,
                    child: Image.network(controller.imageURL.value),
                  )
                : const SizedBox(),
            Text(controller.imageURL.value),
            Align(
              alignment: Alignment.centerLeft,
              child: TitleText(text: controller.title.value),
            ),
            DescriptionText(text: controller.description.value)
          ],
        ),
      ),
    );
  }
}
