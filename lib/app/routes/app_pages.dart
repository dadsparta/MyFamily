import 'package:get/get.dart';
import 'package:myfamily/app/pages/date_time_page/date_time_view.dart';

part 'app_route.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: _Paths.dateTime,
      page: () => const DateTimePView(),
    ),
  ];
}
