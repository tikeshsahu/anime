import 'package:flutter/foundation.dart';
import 'package:fox_anime/services/api_services.dart/api.dart';
import 'package:get/get.dart';

class AnimeDetailsController extends GetxController {
  final RxBool _isFetchingDetails = RxBool(false);

  final RxString _animeId = RxString("");

  final RxMap _animeData = RxMap({});

  Map get animeData => _animeData;

  String get animeId => _animeId.value;

  bool get isFetchingDetails => _isFetchingDetails.value;

  @override
  void onInit() {
    if (Get.arguments["animeId"] != null) {
      _animeId.value = Get.arguments["animeId"]!;
    }
    getAnimeDetails();
    super.onInit();
  }

  updateIsFetchingAnimeDetails(bool value) {
    _isFetchingDetails.value = value;
    update();
  }

  updateAnimeData(Map value) {
    _animeData.value = value;
    update();
  }

  getAnimeDetails() async {
    updateIsFetchingAnimeDetails(true);
    try {
      final response = await Api.instance.fetchAnimeByAnimeId(animeId: animeId);
      updateAnimeData(response);
      updateIsFetchingAnimeDetails(false);
    } catch (e) {
      updateIsFetchingAnimeDetails(false);
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
