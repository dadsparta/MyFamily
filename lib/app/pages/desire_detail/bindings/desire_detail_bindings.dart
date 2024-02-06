import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:myfamily/app/pages/desire_detail/controllers/desire_detail_controller.dart';
import 'package:myfamily/app/pages/desire_detail/views/desire_detail.dart';

class DesireDetailBinding extends Binding{
  @override
  List<Bind> dependencies() {
    return[
      Bind.lazyPut(() => DesireDetailController())
    ];
  }

}