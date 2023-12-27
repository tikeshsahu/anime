

import 'package:get/get.dart';
import 'package:fox_anime/modules/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}