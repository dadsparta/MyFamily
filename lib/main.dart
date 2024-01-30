import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:myfamily/app/data/app_injector.dart';
import 'package:myfamily/app/routes/app_pages.dart';
import 'package:myfamily/core/consts/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initInjector();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  runApp(
    GetMaterialApp(
      title: "MyFamily",
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      initialRoute: Routes.dateTime,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.firstColor,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.secondColor),
        dividerTheme: const DividerThemeData(
          color: AppColors.secondColor,
        ),
      ),
    ),
  );
}
