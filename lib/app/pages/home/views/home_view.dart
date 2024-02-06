import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:myfamily/app/global_widgets/add_desire_bottomsheet.dart';
import 'package:myfamily/app/pages/home/controllers/home_controller.dart';
import 'package:myfamily/app/pages/home/tabs/desires/views/desires_view.dart';
import 'package:myfamily/core/consts/colors.dart';

import '../tabs/toghether_time/views/date_time_view.dart';

class HomeView extends GetView<HomeController> {
  final pages = [Desires(), const TogetherTime()];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Container(
          decoration: controller.selectedPageIndex.value == 0
              ? const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover),
                )
              : const BoxDecoration(color: Colors.black),
          child: PageView.builder(
            itemCount: pages.length,
            controller: controller.pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) =>
                controller.selectedPageIndex.value = value,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            onTap: controller.onSelectPage,
            currentIndex: controller.selectedPageIndex.value,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: AppColors.secondColor,
            selectedItemColor: AppColors.cardColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.rule),
                label: 'Desires',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart_fill),
                label: 'Time',
              )
            ],
          ),
        ),
      ),
    );
  }
}
