import 'package:flutter/material.dart';

import '../../utilities/consts/colors.dart';
import '../../utilities/consts/texts.dart';
import '../../utilities/samples/checkbox.dart';

class WifePageView extends StatefulWidget {
  const WifePageView({Key? key}) : super(key: key);

  @override
  State<WifePageView> createState() => _WifePageViewState();
}

class _WifePageViewState extends State<WifePageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: firstColor,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: TitleText(text: 'Аня'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemSample(text: 's',);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: 30),
        ],
      ),
    );
  }
}
