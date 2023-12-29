import 'package:flutter/material.dart';
import 'package:fox_anime/constants/app_constants.dart';
import 'package:fox_anime/modules/layout/layout_controller.dart';
import 'package:fox_anime/modules/layout/widgets/nav_bar_widget.dart';
import 'package:get/get.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layoutController = Get.put(LayoutController());

    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
            //color: Colors.red,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(AppDimension.normalRadius * 2),
            //   topRight: Radius.circular(AppDimension.normalRadius * 2),
            // ),
            // boxShadow: [
            //   BoxShadow(
            //     color: AppTheme.themeBlackColor,
            //     blurRadius: 2,
            //   ),
            // ],
            ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: AppConstants.normalPadding),
              Expanded(
                flex: 1,
                child: CustomizedNavBarWidget(
                  title: "home".tr,
                  icon: layoutController.currentIndex == 0 ? Icons.home : Icons.home_outlined,
                  index: 0,
                ),
              ),
              const SizedBox(width: AppConstants.normalPadding * 2),
              Expanded(flex: 1, child: CustomizedNavBarWidget(title: "profile".tr, icon: layoutController.currentIndex == 1 ? Icons.person : Icons.person_outlined, index: 1)),
              const SizedBox(width: AppConstants.normalPadding),
            ],
          ),
        ),
      ),
      body: Obx(
        () => layoutController.bodyPages[layoutController.currentIndex],
      ),
    );
  }
}
