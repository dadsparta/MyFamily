import 'package:flutter_date_difference/flutter_date_difference.dart';
import 'package:get/get.dart';

class TogetherTimeController extends GetxController{

  String getDifferenceOfDate() {
    var dateDifferenceInMounths = FlutterDateDifference()
        .calculate(DateTime(2023, 8, 25), DateTime.now());
    return "We have been together for $dateDifferenceInMounths";
  }

}