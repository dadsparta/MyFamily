import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myfamily/app/pages/home/controllers/home_controller.dart';
import 'package:myfamily/app/pages/home/tabs/desires/controllers/desires_page_controller.dart';
import 'package:myfamily/app/pages/home/tabs/settings/controller/settings_controller.dart';
import 'package:myfamily/app/pages/home/tabs/toghether_time/controllers/together_time_controller.dart';

class HomeBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(
        () => HomeController(),
      ),
      Bind.lazyPut(
        () => DesiresController(),
      ),
      Bind.lazyPut(
        () => SettingsController(),
      ),
      Bind.lazyPut(
        () => TogetherTimeController(),
      ),
    ];
  }
}
