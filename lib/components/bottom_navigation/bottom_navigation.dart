import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fox_anime/components/bottom_navigation/bottom_navigation_controller.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    final bottomNavController = Get.put(BottomNavigationController());
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      onTap: (index) {
        // BlocProvider.of<MovieBloc>(context).add(
        //   ChangePageEvent(
        //     currentPage: index,
        //   ),
        // );
        // print('--------------${state.currantIndex}');

        print(index);
        bottomNavController.updateBottomBarIndex(index);
      },
      // currentIndex: BlocProvider.of<MovieBloc>(context).index,
      currentIndex: bottomNavController.bottomBarIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Movie',
          icon: Icon(
            Icons.movie,
            color: Colors.white,
          ),
          // Image.asset(
          //   'assets/images/bottom_nav_images/nav_home.png',
          //   width: 25.0,
          //   height: 25.0,
          //   color: Colors.white,
          // ),
        ),
        // BottomNavigationBarItem(
        //   label: 'TV',
        //   icon: Image.asset(
        //     'assets/images/icon_bottom_navigation/tv-pngrepo-com.png',
        //     width: 25.0,
        //     height: 25.0,
        //     color: Colors.white,
        //   ),
        // ),
        // BottomNavigationBarItem(
        //   label: 'Bookmark',
        //   icon: Image.asset(
        //     'assets/images/icon_bottom_navigation/bookmark.png',
        //     width: 25.0,
        //     height: 25.0,
        //     color: Colors.white,
        //   ),
        // ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          // Image.asset(
          //   'assets/images/bottom_nav_images/nav_profile.png',
          //   width: 25.0,
          //   height: 25.0,
          //   color: Colors.white,
          // ),
        ),
      ],
    );
  }
}
