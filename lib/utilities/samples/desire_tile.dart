import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/pages/page_controller/page_controller_model.dart';

import '../../data/models/desire.dart';
import '../../pages/main_page/main_page_model.dart';
import '../consts/colors.dart';

class ItemSample extends StatefulWidget {
  ItemSample(
      {Key? key,
      required this.text,
      required this.instance,
      required this.index})
      : super(key: key);
  int index;
  String text;
  final FirebaseFirestore instance;

  @override
  State<ItemSample> createState() => _ItemSampleState();
}

class _ItemSampleState extends State<ItemSample> {
  bool _value = false;

  String idOfDesire = "";
  String creator = "Own";

  @override
  void initState() {
    super.initState();
    model = MainPageModel(firestore: widget.instance, state: this);
    model.initState();
  }

  late MainPageModel model;

  Color checkCreator(){
    if (creator == "male") {
      return cardColor;
    }
    if(creator == "female"){
      return Colors.blue;
    }
    return Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: checkCreator(),
      ),
      child: ListTile(
        leading: Checkbox(
          value: _value,
          onChanged: (bool? value) {
            setState(() {
              _value = !_value;
            });
            if (_value) {
              setState(() {
                model.mainService.deleteDesire(idOfDesire);
                model.mainService.getDesires();
              });

            }
          },
        ),
        title: FutureBuilder<List<Desire>?>(
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
              return Text(
                snapshot.data![widget.index].title,
                style: const TextStyle(fontSize: 22),
              );
            }),
      ),
    );
  }
}
