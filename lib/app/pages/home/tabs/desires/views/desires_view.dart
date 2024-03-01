import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/global_widgets/add_desire_bottomsheet.dart';
import 'package:myfamily/app/global_widgets/app_tab.dart';
import 'package:myfamily/app/global_widgets/desire_tile.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_page_controller.dart';

import 'package:myfamily/core/theme/app_colors.dart';
import 'package:myfamily/core/theme/texts.dart';
import 'package:myfamily/data/models/desire.dart';

class Desires extends GetView<DesiresController> {
  Desires({super.key});

  Widget generator(Rx<List<Desire>?> listOfDesires) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      child: RefreshIndicator(
        backgroundColor: AppColors.secondColor,
        color: AppColors.cardColor,
        onRefresh: () async {
          await controller.getListsOfDesires();
        },
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              if (listOfDesires.value == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ); // Экран загрузки
              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => DesireTile(
                    desire: listOfDesires.value![index].obs,
                    function: () => controller.onDeleteDesire(
                        listOfDesires.value![index].imagePath,
                        listOfDesires.value![index].id!),
                  ),
                  itemCount: listOfDesires.value!.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                );
              }
            }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            bottom: const TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.cardColor,
              labelColor: AppColors.cardColor,
              tabs: [
                AppTab(
                  title: 'All',
                  color: AppColors.togetherColor,
                ),
                AppTab(
                  title: 'Our',
                  color: AppColors.togetherColor,
                ),
                AppTab(
                  title: 'Hanna',
                  color: AppColors.femaleColor,
                ),
                AppTab(
                  title: 'Yan',
                  color: AppColors.maleColor,
                ),
              ],
            ),
            title: Center(
              child: AppText.title('Desires'),
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomRight,
            children: [
              TabBarView(
                children: [
                  generator(controller.listOfAllDesires),
                  generator(controller.listOfOurDesires),
                  generator(controller.listOfFemaleDesires),
                  generator(controller.listOfMaleDesires),
                ],
              ),
              AddDesiresBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
