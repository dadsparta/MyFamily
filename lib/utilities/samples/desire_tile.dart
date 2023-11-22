import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/models/desire.dart';
import '../../pages/main_page/main_page_model.dart';
import '../consts/colors.dart';

class ItemSample extends StatefulWidget {
  ItemSample({Key? key, required this.text, required this.instance})
      : super(key: key);
  String text;
  final FirebaseFirestore instance;

  @override
  State<ItemSample> createState() => _ItemSampleState();
}

class _ItemSampleState extends State<ItemSample> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    model = MainPageModel(firestore: widget.instance, state: this);
    model.initState();
  }

  late MainPageModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardColor,
      ),
      child: ListTile(
        leading: Checkbox(
          value: _value,
          onChanged: (bool? value) {
            setState(() {
              _value = !_value;
            });
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    snapshot.data![index].title,
                    style: TextStyle(fontSize: 22),
                  );
                },
              );
            }),
      ),
    );
  }
}
