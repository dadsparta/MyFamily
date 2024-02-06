import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:myfamily/core/consts/texts.dart';

import '../controllers/together_time_controller.dart';

class TogetherTime extends GetView<TogetherTimeController> {
  const TogetherTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const SizedBox(height: 140),
          Image.asset('assets/images/tokyo.png'),
          const SizedBox(height: 20),
           DateTimeText(
              text: controller.getDifferenceOfDate(),
            ),
        ],
      ),
    );
  }
}
