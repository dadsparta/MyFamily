import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:myfamily/app/data/app_injector.dart';
import 'package:myfamily/app/routes/app_pages.dart';
import 'package:myfamily/core/consts/colors.dart';
import 'package:myfamily/core/services/firestore_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initInjector();
  Get.put(FirestoreController());
  runApp(
    GetMaterialApp(
      title: "MyFamily",
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      initialRoute: Routes.home,
      builder: (context, page) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          );
        },
        child: page ?? const SizedBox.shrink(),
      ),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(bodyMedium: TextStyle(color: AppColors.textColor)),
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.secondColor),
        dividerTheme: const DividerThemeData(
          color: AppColors.secondColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

