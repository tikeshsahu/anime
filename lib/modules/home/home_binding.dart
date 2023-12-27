

import 'package:get/get.dart';
import 'package:fox_anime/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}