import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/global_widgets/add_desire_bottomsheet.dart';
import 'package:myfamily/app/global_widgets/desire_tile.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_page_controller.dart';
import 'package:myfamily/core/consts/texts.dart';
import 'package:myfamily/data/models/desire.dart';

class Desires extends GetView<DesiresController> {
  Desires({super.key});

  List<Desire> desires = [
    Desire(
      title: 'Чек',
      description: "Дескрипшн",
      creator: 'male',
      imagePath:
          'https://firebasestorage.googleapis.com/v0/b/myfamily-d0b0a.appspot.com/o/desires%2F1702159631200.jpg?alt=media&token=4acaf628-6918-4c46-bea3-6358da14688e',
    ),
    Desire(
      title: 'Помидор',
      description: "ЭТО СУПЕР ДУПЕР ПОМИДОР!!!",
      creator: 'female',
      imagePath:
      'https://firebasestorage.googleapis.com/v0/b/myfamily-d0b0a.appspot.com/o/desires%2F1702159631200.jpg?alt=media&token=4acaf628-6918-4c46-bea3-6358da14688e',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TitleText(text: "Desires"),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => DesireTile(
                    desire: desires[index],
                  ),
                  itemCount: desires.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            AddDesiresButtomsheet(
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
