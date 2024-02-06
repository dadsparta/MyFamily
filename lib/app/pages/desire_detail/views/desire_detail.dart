import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:myfamily/app/pages/desire_detail/controllers/desire_detail_controller.dart';

class DesireDetail extends GetView<DesireDetailController> {
  const DesireDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: controller.cardColor),
        child: SafeArea(child: Text(controller.text)),
    );
  }
}
