

import 'package:get/get.dart';
import 'package:fox_anime/modules/anime_details/anime_details_controller.dart';

class AnimeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimeDetailsController(), fenix: true);
  }
}