
import 'package:get/get.dart';
import 'package:fox_anime/modules/anime_details/anime_details_binding.dart';
import 'package:fox_anime/modules/anime_details/anime_details_screen.dart';
import 'package:fox_anime/modules/home/home_binding.dart';
import 'package:fox_anime/modules/home/home_screen.dart';
import 'package:fox_anime/modules/layout/layout_binding.dart';
import 'package:fox_anime/modules/layout/layout_screen.dart';
import 'package:fox_anime/modules/profile/profile_binding.dart';
import 'package:fox_anime/modules/profile/profile_screen.dart';
import 'package:fox_anime/routes/app_routes.dart';

class AppPages{
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.layoutRoute,
      page: () => const LayoutScreen(),
      bindings: [
        LayoutBinding(),
        HomeBinding(),
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.homeRoute, 
      page: () => const HomeScreen(), 
      binding: HomeBinding()
    ),
    GetPage(
      name: AppRoutes.profileRoute,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.animeDetailsRoute,
      page: () => const AnimeDetailsScreen(),
      binding: AnimeDetailsBinding(),
    ),
  ];

}