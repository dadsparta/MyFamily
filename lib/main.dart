import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:myfamily/app/injectors/app_injector.dart';
import 'package:myfamily/app/routes/app_pages.dart';
import 'package:myfamily/core/theme/app_colors.dart';
import 'package:myfamily/generated/locales.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initInjector();
  runApp(
    GetMaterialApp(
      title: "MyFamily",
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      initialRoute: Routes.home,
      locale: Locale('en'),
      translationsKeys: AppTranslation.translations,
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
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.textColor),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.secondColor),
        dividerTheme: const DividerThemeData(
          color: AppColors.secondColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
