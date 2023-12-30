import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fox_anime/components/popular.dart';
import 'package:fox_anime/modules/chew.dart';
import 'package:fox_anime/modules/video_player/video_player_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPlayerController = Get.put(VideoPlayerCController());
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Obx(
          () => !videoPlayerController.readyToShow
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    // Video player
                    Container(
                      height: size.height / 2.75,
                      color: Colors.black26,
                      child:
                          // videoPlayerController.chewieController != null && videoPlayerController.chewieController.videoPlayerController.value.isInitialized
                          videoPlayerController.chewieController.videoPlayerController.value.isInitialized
                              ? Chewie(
                                  controller: videoPlayerController.chewieController,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 20),
                                    Text('Loading'),
                                  ],
                                ),
                    ),

                    // Episodes
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "popular".tr,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => const SeeMoreMovie(
                              //       title: 'popular',
                              //     ),
                              //   ),
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "seeMore".tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const PopularMovie(),
                  ],
                ),
        )),
      ),
    );
  }
}
