import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/utilities/consts/colors.dart';
import 'package:myfamily/utilities/consts/texts.dart';
import 'package:myfamily/utilities/samples/desire_tile.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key, required this.instance}) : super(key: key);
  final FirebaseFirestore instance;

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late MainPageModel model;

  @override
  void initState() {
    super.initState();
    model = MainPageModel(firestore: widget.instance, state: this);
    model.initState();
    model.mainService.getDesires();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: firstColor,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
        children: [
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.center,
            child: TitleText(text: 'Желания'),
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
              return ItemSample(
                text: '1',
                instance: model.firestore,
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: model.mainService.ListOfDiseres.length,
          ),
        ],
      ),
    );
  }
}
