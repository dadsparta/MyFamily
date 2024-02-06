import 'package:get/get.dart';
import 'package:myfamily/app/pages/desire_detail/bindings/desire_detail_bindings.dart';
import 'package:myfamily/app/pages/desire_detail/views/desire_detail.dart';
import 'package:myfamily/app/pages/home/bindings/home_binding.dart';
import 'package:myfamily/app/pages/home/views/home_view.dart';


part 'app_route.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: _Paths.desireDetail,
      page: () => DesireDetail(),
      binding: DesireDetailBinding(),
    ),
  ];
}
