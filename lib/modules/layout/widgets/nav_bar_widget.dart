import 'package:flutter/material.dart';
import 'package:fox_anime/constants/app_constants.dart';
import 'package:fox_anime/modules/layout/layout_controller.dart';
import 'package:get/get.dart';


class CustomizedNavBarWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  
  const CustomizedNavBarWidget({super.key, required this.title, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    final LayoutController layoutController = Get.find();
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: index == layoutController.currentIndex ? Colors.red : Colors.transparent,
              width: 2,
            )
          )
        ),
        child: AnimatedContainer(
          curve: Curves.fastOutSlowIn,
          padding: const EdgeInsets.symmetric(
            vertical: AppConstants.normalPadding
          ),
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              Obx(() => 
              Icon(
                icon,
                color: index != layoutController.currentIndex ? Colors.grey : Colors.red,
              )
              ),
              const SizedBox(height: 2),
              Obx(() => 
              Text(
                title.toUpperCase(),
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  fontWeight: index != layoutController.currentIndex ? FontWeight.normal : FontWeight.bold,
                  color: index != layoutController.currentIndex ? Colors.grey : Colors.black
                ),
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}