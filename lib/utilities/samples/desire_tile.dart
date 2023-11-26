import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/pages/main_page/main_page_view.dart';
import 'package:myfamily/pages/page_controller/page_controller_model.dart';
import 'package:myfamily/utilities/consts/texts.dart';
import 'package:myfamily/utilities/samples/desire_tile_detail.dart';

import '../../data/models/desire.dart';
import '../../pages/main_page/main_page_model.dart';
import '../consts/colors.dart';

class DesireSample extends StatefulWidget {
  DesireSample(
      {Key? key,
      required this.text,
      required this.instance,
      required this.index,
      required this.state})
      : super(key: key);
  State state;
  int index;
  String text;
  final FirebaseFirestore instance;

  @override
  State<DesireSample> createState() => _DesireSampleState();
}

class _DesireSampleState extends State<DesireSample> {
  bool _value = false;

  String idOfDesire = "";
  String creator = "Own";

  late MainPageModel model;

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
          idOfDesire = snapshot.data![widget.index].id!;
          creator = snapshot.data![widget.index].creator;
          return Container(
            alignment: Alignment.center,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: checkCreator(),
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DesireTileDetail(
                        index: widget.index,
                        text: widget.text,
                        instance: widget.instance),
                  ),
                );
              },
              leading: Checkbox(
                value: _value,
                onChanged: (bool? value) {
                  setState(() {
                    _value = !_value;
                  });
                  if (_value) {
                    model.mainService.deleteDesire(idOfDesire);
                    model.mainService.getDesires();
                    widget.state.setState(() {
                    });
                    _value = !_value;
                  }
                },
              ),
              title: DesireSampleText(
                text: snapshot.data![widget.index].title,
              ),
            ),
          );
        });
  }
}
