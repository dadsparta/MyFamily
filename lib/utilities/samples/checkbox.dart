import 'package:flutter/material.dart';

import '../consts/colors.dart';

class ItemSample extends StatefulWidget {
  ItemSample({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  State<ItemSample> createState() => _ItemSampleState();
}

class _ItemSampleState extends State<ItemSample> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondColor,
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
        title: Text(widget.text),
      ),
    );
  }
}
