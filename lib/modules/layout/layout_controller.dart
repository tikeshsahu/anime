import 'package:fox_anime/modules/home/home_controller.dart';
import 'package:fox_anime/modules/home/home_screen.dart';
import 'package:fox_anime/modules/profile/profile_controller.dart';
import 'package:fox_anime/modules/profile/profile_screen.dart';
import 'package:fox_anime/modules/search/search_controller.dart';
import 'package:fox_anime/modules/search/search_screen.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final bodyPages = [const HomeScreen(), const SearchScreen(), const ProfileScreen()];
  final RxInt _currentIndex = RxInt(0);

  // getter
  int get currentIndex => _currentIndex.value;

  changeIndex(int value) {
    _currentIndex.value = value;
    if (value == 0) {
      Get.delete<ProfileController>();
      Get.delete<SearchController>();
    } else if (value == 1) {
      Get.delete<HomeController>();
      Get.delete<ProfileController>();
    } else {
      Get.delete<HomeController>();
      Get.delete<SearchController>();
    }
    update();
  }
}
