import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/utilities/consts/colors.dart';
import 'package:myfamily/utilities/consts/texts.dart';
import 'package:myfamily/utilities/samples/desire_tile.dart';

import '../../data/models/desire.dart';
import '../../utilities/samples/teg.dart';
import '../page_controller/page_controller_model.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key, required this.instance}) : super(key: key);
  final FirebaseFirestore instance;

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late MainPageModel model;

  @override
  void initState() {
    super.initState();
    model = MainPageModel(firestore: widget.instance, state: this);
    model.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Desire>?>(
        future: model.mainService.getDesires(),
        builder: (context, snapshot) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                color: firstColor,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TitleText(text: 'Желания'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return DesireSample(
                          text: '1',
                          instance: model.firestore,
                          index: index,
                          state: this,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: model.mainService.ListOfDiseres.length,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: firstColor,
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
                                  Teg(
                                    title: 'Ваня',
                                    creator: 'male',
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Teg(
                                    title: 'Аня',
                                    creator: 'female',
                                  ),
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
                                controller:
                                    PageControllerModel.descriptionController,
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
                                      PageControllerModel
                                          .descriptionController.text,
                                      PageControllerModel.Creator);
                                  PageControllerModel.ClearControllers();
                                  Navigator.pop(context);
                                },
                                child: const Text('Отправить'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  backgroundColor: secondColor,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          );
        });
  }
}
