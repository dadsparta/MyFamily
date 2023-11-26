import 'package:flutter/material.dart';
import 'package:myfamily/pages/page_controller/page_controller_model.dart';

import '../consts/colors.dart';

class Teg extends StatefulWidget {
  const Teg({Key? key, required this.title, required this.creator}) : super(key: key);
  final String title;
  final String creator;

  @override
  State<Teg> createState() => _TegState();
}

class _TegState extends State<Teg> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(
            () {
              PageControllerModel.Creator = widget.creator;
              isPressed = !isPressed;
            },
          );
        },
        child: !isPressed
            ? Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: secondColor),
                child: Text(
                  widget.title,
                  style: const TextStyle(color: textColor),
                ),
              )
            : Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: cardColor),
                child: Text(
                  widget.title,
                  style: const TextStyle(color: textColor),
                ),
              ),
      ),
    );
  }
}
