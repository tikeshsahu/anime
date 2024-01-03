import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fox_anime/components/popular.dart';
import 'package:fox_anime/modules/anime_details/anime_details_controller.dart';
import 'package:fox_anime/utils/app_constants.dart';
import 'package:fox_anime/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimeDetailsController detailsController = Get.put(AnimeDetailsController());
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    Offset tapPosition = Offset.zero;
    return Scaffold(
      body: SafeArea(
          top: true,
          bottom: true,
          child: Obx(
            () => detailsController.isFetchingDetails
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        expandedHeight: 250.0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: FadeIn(
                            duration: const Duration(milliseconds: 500),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.videoPlayerRoute),
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    stops: [0.0, 0.5, 1.0, 1.0],
                                  ).createShader(
                                    Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                  width: MediaQuery.of(context).size.width,
                                  imageUrl: detailsController.animeData["animeImg"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: FadeInUp(
                          from: 20,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(detailsController.animeData["animeTitle"],
                                    style: GoogleFonts.poppins(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.2,
                                    )),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2.0,
                                        horizontal: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: const Text(
                                        "falana",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          222.toStringAsFixed(1),
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        const SizedBox(width: 4.0),
                                        const Text(
                                          'voteAverage',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 16.0),
                                  ],
                                ),
                                const SizedBox(height: 20.0),
                                Text(
                                  detailsController.animeData["synopsis"],
                                  style: const TextStyle(
                                    // color: Colors.white70,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 8.0),
                        sliver: SliverToBoxAdapter(
                          child: FadeInUp(
                            from: 20,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              'Total Episodes - ${detailsController.animeData["totalEpisodes"]}',
                              style: GoogleFonts.poppins(
                                // color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: AppConstants.normalPadding - 5),
                        shrinkWrap: true,
                        itemCount: int.parse(detailsController.animeData["totalEpisodes"]),
                        separatorBuilder: (context, index) => const SizedBox(height: 1),
                        itemBuilder: (context, index) {
                          return FadeInUp(
                            from: 20,
                            duration: const Duration(milliseconds: 500),
                            child: Card(
                              elevation: 3,
                              child: ListTile(
                                onTap: () {
                                  Get.toNamed(AppRoutes.videoPlayerRoute, arguments: {"episodeId": index + 1});
                                },
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Episode ${(index + 1).toString()}",
                                  style: GoogleFonts.poppins(
                                    // color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.15,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                    ],
                  ),
          )),
    );
  }
}
