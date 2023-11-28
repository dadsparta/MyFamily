import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/utilities/consts/colors.dart';
import 'package:myfamily/utilities/consts/texts.dart';
import 'package:myfamily/utilities/samples/add_desire_panel.dart';
import 'package:myfamily/utilities/samples/desire_tile.dart';
import 'package:myfamily/utilities/samples/tegs/filter_teg.dart';

import '../../data/models/desire.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Desire>?>(
        future: model.mainService.getDesires(),
        builder: (context, snapshot) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
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
                     Row(
                      children: [
                        FilterTeg(title: "Общее", creator: "Own", state: this, ),
                        SizedBox(width: 8,),
                        FilterTeg(title: "Ваня", creator: "male", state:  this,),
                        SizedBox(width: 8,),
                        FilterTeg(title: 'Аня', creator: "female", state: this,)
                      ],
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
                    ListView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return model.generatorOfDesire(index, this);
                      },
                      itemCount: model.mainService.ListOfDiseres.length,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: AddDesirePanel(model: model),
              ),
            ],
          );
        });
  }
}
