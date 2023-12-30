



import 'package:fox_anime/modules/video_player/video_player_controller.dart';
import 'package:get/get.dart';

class VideoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoPlayerCController(), fenix: true);
  }
}