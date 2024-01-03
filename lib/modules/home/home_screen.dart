import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fox_anime/components/anime_tabs_list_widget.dart';
import 'package:fox_anime/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:fox_anime/components/bottom_navigation/bottom_navigation.dart';
import 'package:fox_anime/components/now_playing.dart';
import 'package:fox_anime/components/popular.dart';
import 'package:fox_anime/modules/home/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,

      // bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          // key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => homeController.isFetchingTopAnimes
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const NowPlaying()),
              // Text(
              //   "popular".tr,
              //   style: GoogleFonts.poppins(
              //     color: Colors.white,
              //     fontSize: 19,
              //     fontWeight: FontWeight.w500,
              //     letterSpacing: 0.15,
              //   ),
              // ),

              // Animes By Type
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.normalPadding / 4),
                child: Obx(
                  () => Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: homeController.navbarIndex == 0 ? Colors.white : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.normalPadding,
                          ),
                          child: TextButton(
                            onPressed: () {
                              homeController.updateNavbarIndex(0);
                              homeController.pagingController.refresh();
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "popular".tr,
                                style: textTheme.titleSmall!.copyWith(
                                  color: homeController.navbarIndex == 0 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.normalPadding,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: homeController.navbarIndex == 1 ? Colors.white : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              homeController.updateNavbarIndex(1);
                              homeController.pagingController.refresh();
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "upcoming".tr,
                                style: textTheme.titleSmall!.copyWith(
                                  color: homeController.navbarIndex == 1 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.normalPadding,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: homeController.navbarIndex == 2 ? Colors.white : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              homeController.updateNavbarIndex(2);
                              homeController.pagingController.refresh();
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "airing".tr,
                                style: textTheme.titleSmall!.copyWith(
                                  color: homeController.navbarIndex == 2 ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppConstants.normalPadding),

              FadeIn(
                duration: const Duration(milliseconds: 500),
                child: PagedListView.separated(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  pagingController: homeController.pagingController,
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, dynamic item, index) {
                      return InkWell(
                        onTap: () async {
                          var animeData = await homeController.getAnimeData(item["title"]);
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ShowAnimeTabsList(animesList: animeData);
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            height: size.height * 0.25,
                            // width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: item["images"]["jpg"]["large_image_url"],
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                // width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: AppConstants.normalPadding),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
