import 'package:get/get.dart';
import 'package:soft_bd/presentation/state_holder/date_controller.dart';

class StateHolderBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DateController());
  }
}
