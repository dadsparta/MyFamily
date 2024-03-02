import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_difference/flutter_date_difference.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/pages/home/tabs/toghether_time/controllers/together_time_controller.dart';
import 'package:myfamily/core/theme/texts.dart';
import 'package:myfamily/generated/locales.g.dart';


class TogetherTime extends GetView<TogetherTimeController> {
  const TogetherTime({Key? key}) : super(key: key);

  String getDifferenceOfDate() {
    var dateDifferenceInMounths = FlutterDateDifference()
        .calculate(DateTime(2023, 8, 25), DateTime.now());
    return "${LocaleKeys.time_together_prev.tr} $dateDifferenceInMounths";
  }
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
            getDifferenceOfDate(),
          ),
        ],
      ),
    );
  }
}
