import 'package:get/get.dart';
import 'package:fox_anime/modules/home/home_controller.dart';
import 'package:fox_anime/modules/profile/profile_controller.dart';

class BottomNavigationController extends GetxController {
  final RxInt _bottomBarIndex = RxInt(0);

  int get bottomBarIndex => _bottomBarIndex.value;

  updateBottomBarIndex(int value) {
    // if (value != 3) {
    //   Get.delete<ProfileController>();
    // }
    // final HomeController homeController = Get.find();
    _bottomBarIndex.value = value;
    update();
  }
}
