import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fox_anime/components/bottom_navigation/bottom_navigation.dart';
import 'package:fox_anime/components/now_playing.dart';
import 'package:fox_anime/components/popular.dart';
import 'package:fox_anime/modules/home/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'animes'.tr,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          // IconButton(
          //   onPressed: () => Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (BuildContext context) => const SearchScreen())),
          //   icon: Icon(
          //     Icons.search,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
      // bottomNavigationBar: const BottomNavigation(),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        // key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlaying(),
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
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "topRated".tr,
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
                      //       title: 'top rated',
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
            //const TopratedMovie(),
            const PopularMovie(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "upcoming".tr,
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
                      //       title: 'upcoming',
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
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
