import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fox_anime/modules/home/home_controller.dart';
import 'package:fox_anime/routes/app_routes.dart';
import 'package:get/get.dart';

class ShowAnimeTabsList extends StatelessWidget {
  final List animesList;
  const ShowAnimeTabsList({super.key, required this.animesList});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    // final homeController = Get.find<HomeController>();
    return AlertDialog(
      backgroundColor: Colors.black,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: 'select'.tr, style: textTheme.labelLarge),
      ),
      // actionsAlignment: MainAxisAlignment.spaceAround,
      // actionsOverflowDirection: VerticalDirection.down,
      actions: <Widget>[
        SizedBox(
          // color: Colors.black12,
          width: size.width / 1.1,
          height: 550,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
              childAspectRatio: 0.7, // item height to item width ratio
            ),
            padding: const EdgeInsets.all(8.0), // padding around the grid
            itemCount: animesList.length, // total number of items
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.animeDetailsRoute, arguments: {"animeId": animesList[index]["animeId"]});
                },
                child: Column(
                  children: [
                    CachedNetworkImage(
                      height: 140.0,
                      width: double.infinity,
                      imageUrl: animesList[index]["animeImg"],
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      animesList[index]["animeTitle"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
