import 'package:flutter/material.dart';

import '../consts/colors.dart';

class Teg extends StatefulWidget {
  const Teg({Key? key, required this.title}) : super(key: key);
  final String title;

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
