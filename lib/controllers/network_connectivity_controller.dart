import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fox_anime/components/no_internet_dialogue.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.dialog(const NoInternetDialog(), barrierDismissible: false);
    } else {
      if (Get.isDialogOpen!) {
        Navigator.of(Get.context!).pop();
      }
    }
  }
}