import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myfamily/app/pages/home/controllers/home_controller.dart';
import 'package:myfamily/app/pages/home/views/home_view.dart';

import '../tabs/desires/controllers/desires_tile_controller.dart';
import '../tabs/toghether_time/controllers/together_time_controller.dart';

class HomeBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(
        () => HomeController(),
      ),
      Bind.lazyPut(
        () => DesiresTileController(text: ''.obs, gender: ''.obs),
      ),
      Bind.lazyPut(
        () => TogetherTimeController(),
      ),
    ];
  }
}
