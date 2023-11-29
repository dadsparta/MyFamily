import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/desire.dart';
import '../../../pages/main_page/main_page_model.dart';
import '../../consts/colors.dart';
import '../../consts/texts.dart';
import '../desire_tile_detail.dart';

class DesireManSample extends StatefulWidget {
  DesireManSample({
    Key? key,
    required this.text,
    required this.instance,
    required this.index,
    required this.state,
  }) : super(key: key);
  State state;
  int index;
  String text;
  final FirebaseFirestore instance;

  @override
  State<DesireManSample> createState() => _DesireManSampleState();
}

class _DesireManSampleState extends State<DesireManSample> {
  bool _value = false;

  String idOfDesire = "";
  String creator = "Own";
  String imageUrl = "";


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
          imageUrl = snapshot.data![widget.index].imagePath!;
          creator = snapshot.data![widget.index].creator;
          if (creator != "male") {
            return Container();
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
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
                        if (imageUrl == "none") {
                          model.mainService.deleteDesire(idOfDesire);
                        } else {
                          model.mainService
                              .deleteDesireWithImage(idOfDesire, imageUrl);
                        }
                        model.mainService.getDesires();
                        widget.state.setState(() {});
                        _value = !_value;
                      }
                    },
                  ),
                  title: DesireSampleText(
                    text: snapshot.data![widget.index].title,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
