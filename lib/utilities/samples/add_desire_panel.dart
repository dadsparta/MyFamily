import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfamily/pages/main_page/main_page_model.dart';
import 'package:myfamily/utilities/samples/tegs/teg.dart';
import 'package:myfamily/utilities/services/firebase_storage_service.dart';

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
  ImagePicker imagePicker = ImagePicker();
  XFile? _image;


  FirebaseStorageService photoService =
  FirebaseStorageService(firebaseStorage: FirebaseStorage.instance);

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = XFile(image.path);
      } else {
        print('No image selected.');
      }
    });
  }


  void deleteImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
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
                      _image == null
                          ? IconButton(
                          onPressed: () {
                            getImage();
                          },
                          icon: Icon(Icons.photo))
                          : Center(
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SizedBox(
                              height: 300,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    getImage();
                                  });
                                },
                                child: Image.file(
                                  File(_image!.path),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  deleteImage();
                                  deleteImage();
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
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
                        onPressed: () async {
                          Navigator.pop(context);
                          if(_image != null){
                            await photoService.sendImage(_image);

                            widget.model.addDesire(
                                PageControllerModel.titleController.text,
                                PageControllerModel.descriptionController.text,
                                PageControllerModel.Creator,
                                photoService.imageLink,
                                photoService.imageId
                            );
                          }
                          else{
                            widget.model.addDesire(
                                PageControllerModel.titleController.text,
                                PageControllerModel.descriptionController.text,
                                PageControllerModel.Creator,
                                'null',
                                'null'
                            );
                          };

                          PageControllerModel.ClearControllers();
                          _image = null;
                        },
                        child: const Text('Отправить'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      backgroundColor: secondColor,
      child: const Icon(Icons.add),
    );
  }
}
