import 'package:flutter/material.dart';
import 'package:fox_anime/localization/localization.dart';
import 'package:get/get.dart';
import 'package:fox_anime/routes/app_pages.dart';
import 'package:fox_anime/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: 'Anime',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF000000,
          <int, Color>{
            50: const Color(0xFFE0E0E0),
            100: const Color(0xFFB3B3B3),
            200: const Color(0xFF808080),
            300: const Color(0xFF555555),
            400: const Color(0xFF2D2D2D),
            500: const Color(0xFF000000), // Primary color
            600: const Color(0xFF000000),
            700: const Color(0xFF000000),
            800: const Color(0xFF000000),
            900: const Color(0xFF000000),
          },
        ),
      ),
      //theme: AppTheme.lightTheme,
      translations: LanguageTranslations(),
      locale: const Locale("en_US"),
      fallbackLocale: const Locale('en_US'),
      initialRoute: AppRoutes.layoutRoute,
      getPages: AppPages.pages,
    );
  }
}
