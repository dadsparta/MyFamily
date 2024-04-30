import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/data/models/desire.dart';
import 'package:myfamily/app/global_widgets/add_desire_bottomsheet.dart';
import 'package:myfamily/app/global_widgets/app_tab.dart';
import 'package:myfamily/app/global_widgets/desire_tile.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_page_controller.dart';

import 'package:myfamily/core/theme/app_colors.dart';
import 'package:myfamily/core/theme/texts.dart';
import 'package:myfamily/core/values/gender_types.dart';
import 'package:myfamily/generated/locales.g.dart';

class Desires extends GetView<DesiresController> {

  const Desires({super.key});

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: AppColors.cardColor,
            labelColor: AppColors.cardColor,
            tabs: [
              AppTab(
                title: LocaleKeys.tab_all.tr,
                color: AppColors.togetherColor,
              ),
              AppTab(
                title: LocaleKeys.tab_first.tr,
                color: AppColors.togetherColor,
              ),
              AppTab(
                title: LocaleKeys.tab_second.tr,
                color: AppColors.femaleColor,
              ),
              AppTab(
                title: LocaleKeys.tab_third.tr,
                color: AppColors.maleColor,
              ),
            ],
          ),
          title: Center(
            child: AppText.title(LocaleKeys.desires.tr),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Obx(
                ()=> TabBarView(
                children: [
                  generator(controller.listOfAllDesires),
                  generator(controller.sortAndFilterDesires(GenderTypes.first).obs),
                  generator(controller.sortAndFilterDesires(GenderTypes.second).obs),
                  generator(controller.sortAndFilterDesires(GenderTypes.third).obs),
                ],
              ),
            ),
            AddDesiresBottomSheet(),
          ],
        ),
      ),
    );
  }
}
