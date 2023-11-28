import 'package:flutter/material.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/utilities/samples/tegs/teg.dart';

import '../../pages/page_controller/page_controller_model.dart';
import '../consts/colors.dart';
import '../consts/texts.dart';

class AddDesirePanel extends StatefulWidget {
  AddDesirePanel({Key? key, required this.model}) : super(key: key);
  MainPageModel model;


  @override
  State<AddDesirePanel> createState() => _AddDesirePanelState();
}

class _AddDesirePanelState extends State<AddDesirePanel> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
                      widget.model.addDesire(
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
    );
  }
}
