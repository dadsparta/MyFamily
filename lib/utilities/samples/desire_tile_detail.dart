import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/utilities/consts/texts.dart';

import '../../data/models/desire.dart';
import '../../pages/main_page/main_page_model.dart';
import '../consts/colors.dart';

class DesireTileDetail extends StatefulWidget {
  DesireTileDetail(
      {Key? key,
      required this.index,
      required this.text,
      required this.instance})
      : super(
          key: key,
        );

  String text;
  int index;

  final FirebaseFirestore instance;

  @override
  State<DesireTileDetail> createState() => _DesireTileDetailState();
}

class _DesireTileDetailState extends State<DesireTileDetail> {
  late MainPageModel model;
  String creator = "Own";

  @override
  void initState() {
    super.initState();
    model = MainPageModel(firestore: widget.instance, state: this);
    model.initState();
  }

  Color checkCreator() {
    if (creator == "male") {
      return cardColor;
    }
    if (creator == "female") {
      return Colors.blue;
    }
    return Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Desire>?>(
      future: model.mainService.getDesires(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print(
            snapshot.error.toString(),
          );
          return const CircularProgressIndicator();
        }
        creator = snapshot.data![widget.index].creator;
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: checkCreator()),
          child: SafeArea(
            child: ListView(
              children: [
                TitleText(
                  text: snapshot.data![widget.index].title,
                ),
                SizedBox(height: 20,),
                DescriptionText(
                  text: snapshot.data![widget.index].description,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
