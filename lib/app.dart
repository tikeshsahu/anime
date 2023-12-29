import 'package:flutter/material.dart';
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
      //theme: AppTheme.lightTheme,
      //translations: LanguageTranslations(),
      locale: const Locale("en_US"),
      fallbackLocale: const Locale('en_US'),
      initialRoute: AppRoutes.layoutRoute,
      getPages: AppPages.pages,
    );
  }
}
