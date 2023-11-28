import 'package:flutter/material.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/pages/page_controller/page_controller_model.dart';

import '../../consts/colors.dart';

class FilterTeg extends StatefulWidget {
  FilterTeg({Key? key, required this.title, required this.creator, required this.state}) : super(key: key);
  final String title;
  final String creator;
  State state;

  @override
  State<FilterTeg> createState() => _FilterTegState();
}

class _FilterTegState extends State<FilterTeg> {
  bool checkOnPressed(){
    if (widget.creator == "Own") {
      if(MainPageModel.isOwnActive){
        return true;
      }
      else{
        return false;
      }
    }
    if (widget.creator == "female") {
      if(MainPageModel.isWomanActive){
        return true;
      }
      else{
        return false;
      }
    }
    if (widget.creator == "male") {
      if(MainPageModel.isManActive){
        return true;
      }
      else{
        return false;
      }
    }
    return false;

  }
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(
            () {
              isPressed = !isPressed;
              if (isPressed) {
                if (widget.creator == "Own") {
                  MainPageModel.isOwnActive = true;
                }
                if (widget.creator == "male") {
                  MainPageModel.isManActive = true;
                }
                if (widget.creator == "female") {
                  MainPageModel.isWomanActive = true;
                }
              }
              else{
                if (widget.creator == "Own") {
                  MainPageModel.isOwnActive = false;
                }
                if (widget.creator == "male") {
                  MainPageModel.isManActive = false;
                }
                if (widget.creator == "female") {
                  MainPageModel.isWomanActive = false;
                }
              }
              widget.state.setState(() {
              });
            },
          );

        },
        child: !checkOnPressed()
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
