import 'package:flutter/material.dart';
import 'package:myfamily/pages/husband_page/husband_page_view.dart';
import 'package:myfamily/pages/main_page/main_page_view.dart';
import 'package:myfamily/pages/wife_page/wife_page_view.dart';

import '../utilities/consts/colors.dart';

class PageControllerModel extends StatefulWidget {
  const PageControllerModel({Key? key}) : super(key: key);

  @override
  State<PageControllerModel> createState() => _PageControllerModelState();
}

class _PageControllerModelState extends State<PageControllerModel> {
  Widget? pageWidget;
  bool isTuped = false;
  int currentIndexNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isTuped ? pageWidget : const MainPageView(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondColor,
        unselectedItemColor: textColor,
        selectedItemColor: textColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance, color: firstColor),
              label: 'Общая'),
          BottomNavigationBarItem(
              icon: Icon(Icons.man, color: firstColor), label: 'Ваня'),
          BottomNavigationBarItem(
              icon: Icon(Icons.woman, color: firstColor), label: 'Аня'),
        ],
        currentIndex: currentIndexNavBar,
        onTap: (value) {
          return setState(
            () {
              isTuped = true;
              currentIndexNavBar = value;
              switch(value){
                case 0:
                  pageWidget = MainPageView();
                  break;
                case 1:
                  pageWidget = HusbandPageView();
                  break;
                case 2:
                  pageWidget = WifePageView();
                  break;
                default:
                  pageWidget = MainPageView();
              }
            },
          );
        },
      ),
    );
  }
}
