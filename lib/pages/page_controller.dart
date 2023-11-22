import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfamily/pages/date_time_page/date_time_view.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/pages/main_page/main_page_view.dart';
import 'package:myfamily/utilities/consts/texts.dart';
import 'package:myfamily/utilities/samples/teg.dart';

import '../utilities/consts/colors.dart';

class PageControllerModel extends StatefulWidget {
  PageControllerModel({Key? key, required this.instance}) : super(key: key);
  FirebaseFirestore instance;

  @override
  State<PageControllerModel> createState() => _PageControllerModelState();
}

class _PageControllerModelState extends State<PageControllerModel> {

  Widget? pageWidget;
  bool isTuped = false;
  int currentIndexNavBar = 0;
  late MainPageModel model;

  @override
  void initState() {
    super.initState();
    model = MainPageModel(firestore: widget.instance, state: this);
    model.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent),
    );
    return Scaffold(
      body: Container(
        child: isTuped ? pageWidget : MainPageView(instance: model.firestore),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                color: firstColor,
                child: Container(
                  height: 700,
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      TitleText(
                        text: 'Ваше желание:',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Teg(title: 'Общая'),
                          SizedBox(
                            width: 10,
                          ),
                          Teg(title: 'Ваня'),
                          SizedBox(
                            width: 10,
                          ),
                          Teg(title: 'Аня'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'Введите название желания...'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            hintText: 'Введите описание желания...'),
                        maxLines: 4,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: cardColor,
                        ),
                        onPressed: () {},
                        child: Text('Отправить'),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: secondColor,
        child: Icon(Icons.add),
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
              switch (value) {
                case 0:
                  pageWidget = MainPageView(instance: model.firestore,);
                  break;
                case 1:
                 pageWidget = DateTimePView();
                  break;
                default:
                  pageWidget = MainPageView(instance: model.firestore,);
              }
            },
          );
        },
      ),
    );
  }
}
