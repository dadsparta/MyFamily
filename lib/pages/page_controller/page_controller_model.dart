import 'package:flutter/material.dart';

class PageControllerModel{

   static TextEditingController titleController = TextEditingController();
   static TextEditingController descriptionController = TextEditingController();


   static void ClearControllers(){
      titleController.text = "";
      descriptionController.text = "";
   }
   static String Creator = "male";
   static int currentIndexNavBar = 0;

}