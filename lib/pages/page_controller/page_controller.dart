import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfamily/data/models/desire.dart';
import 'package:myfamily/pages/date_time_page/date_time_view.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/pages/main_page/main_page_view.dart';
import 'package:myfamily/pages/page_controller/page_controller_model.dart';
import 'package:myfamily/utilities/consts/texts.dart';
import 'package:myfamily/utilities/samples/teg.dart';

import '../../utilities/consts/colors.dart';

class PageControllers extends StatefulWidget {
  PageControllers({Key? key, required this.instance}) : super(key: key);
  FirebaseFirestore instance;

  @override
  State<PageControllers> createState() => _PageControllersState();
}

class _PageControllersState extends State<PageControllers> {
  Widget? pageWidget;
  bool isTuped = false;
  int currentIndexNavBar = 0;
  late MainPageModel model;
  PageControllerModel pageControllerModel = PageControllerModel();

  @override
  void initState() {
    super.initState();
    model = MainPageModel(firestore: widget.instance, state: this);
    model.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      model.mainService.getDesires();
    });
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
                          Teg(title: 'Общая', creator: 'Own'),
                          SizedBox(
                            width: 10,
                          ),
                          Teg(title: 'Ваня', creator: 'male',),
                          SizedBox(
                            width: 10,
                          ),
                          Teg(title: 'Аня', creator: 'female',),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(PageControllerModel.titleController.text),
                      TextField(
                        decoration: const InputDecoration(
                            hintText: 'Введите название желания...'),
                        controller: PageControllerModel.titleController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                            hintText: 'Введите описание желания...'),
                        maxLines: 4,
                        controller: PageControllerModel.descriptionController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: cardColor,
                        ),
                        onPressed: () {
                          setState(() {});
                          model.addDesire(
                            PageControllerModel.titleController.text,
                            PageControllerModel.descriptionController.text,
                            PageControllerModel.Creator
                          );
                          Navigator.pop(context);
                        },
                        child: const Text('Отправить'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: secondColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondColor,
        unselectedItemColor: textColor,
        selectedItemColor: textColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance, color: firstColor),
              label: 'Желания'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill, color: firstColor),
              label: 'Время'),
        ],
        currentIndex: currentIndexNavBar,
        onTap: (value) {
          return setState(
            () {
              isTuped = true;
              currentIndexNavBar = value;
              switch (value) {
                case 0:
                  setState(() {
                    pageWidget = MainPageView(
                      instance: model.firestore,
                    );
                  });
                  break;
                case 1:
                  setState(() {
                    pageWidget = DateTimePView();
                  });
                  break;
                default:
              }
            },
          );
        },
      ),
    );
  }
}
