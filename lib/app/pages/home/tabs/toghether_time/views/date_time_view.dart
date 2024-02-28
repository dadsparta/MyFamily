import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:myfamily/app/pages/home/tabs/toghether_time/controllers/together_time_controller.dart';
import 'package:myfamily/core/theme/texts.dart';


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
          AppText.dateTimeText(
            controller.getDifferenceOfDate(),
          ),
        ],
      ),
    );
  }
}
