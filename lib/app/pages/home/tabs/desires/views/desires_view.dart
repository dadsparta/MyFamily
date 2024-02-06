import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/global_widgets/desire_tile.dart';
import 'package:myfamily/core/consts/texts.dart';

import '../controllers/desires_tile_controller.dart';

class Desires extends GetView<DesiresTileController>{

  Desires({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      child: SafeArea(
        child: ListView(
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
              itemBuilder: (context, index) => DesireTile(),
              itemCount: 15,
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
      ),
    );
  }
}
