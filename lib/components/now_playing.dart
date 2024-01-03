import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fox_anime/components/anime_tabs_list_widget.dart';
import 'package:fox_anime/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:fox_anime/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return Obx(
      () => homeController.isFetchingTappedAnimeData
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FadeIn(
              duration: const Duration(seconds: 3),
              child: Stack(children: [
                CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      height: 350.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {},
                    ),
                    items: homeController.topAnimesData.map((item) {
                      return GestureDetector(
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
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // fromLTRB
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                              child: CachedNetworkImage(
                                height: 350.0,
                                width: double.infinity,
                                imageUrl: item["images"]["jpg"]["large_image_url"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      item["title"],
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList()),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'trendingAnimes'.tr,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ])),
    );
  }
}
