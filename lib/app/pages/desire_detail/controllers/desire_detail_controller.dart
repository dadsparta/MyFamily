import 'package:get/get.dart';
import 'package:myfamily/data/models/desire.dart';

class DesireDetailController extends GetxController{
  late final Map<String, dynamic> args;
  late final Rx<Desire> desire;
  late final cardColor;



  @override
  void onInit() {
    super.onInit();
    args = Get.arguments;
    desire = args['desire'];
    cardColor = args['cardColor'];
  }

}
