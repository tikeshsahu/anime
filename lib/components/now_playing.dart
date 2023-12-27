import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fox_anime/routes/app_routes.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        duration: const Duration(seconds: 5),
        child:
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 400.0,
            //     viewportFraction: 1.0,
            //     onPageChanged: (index, reason) {},
            //   ),
            //   items: state.nowPlayingMovies.map(
            //     (item) {

            // return
            GestureDetector(
          // key: const Key('openMovieMinimalDetail'),
          onTap: () => Get.toNamed(AppRoutes.animeDetailsRoute),
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
                  height: 260.0,
                  imageUrl: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                  // imageUrl: AppConstant.imageUrl(item.backdropPath),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.redAccent,
                            size: 16.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            'Now Playing'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "dv",
                        // item.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
        ));
  }
}
