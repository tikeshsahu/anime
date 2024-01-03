import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fox_anime/utils/app_constants.dart';
import 'package:fox_anime/modules/search/search_controller.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find();
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          top: true,
          bottom: true,
          child: RefreshIndicator(
            onRefresh: () => Future.sync(
              () {
                searchController.pagingController.refresh();
              },
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppConstants.normalPadding),
                        child: Obx(
                          () => SizedBox(
                            width: (size.width - (AppConstants.normalPadding)),
                            child: TextField(
                              onTapOutside: (_) => FocusScope.of(context).unfocus(),
                              // decoration: AppDecoration.textFieldDecoration().copyWith(
                              //   // hintText: "search".trParams({
                              //   //   "value": "influencer".tr,
                              //   // }),
                              //   prefixIcon: const Icon(
                              //     Icons.search_outlined,
                              //     // size: AppDimension.largeIconSize,
                              //     // color: AppTheme.themePrimaryIconColor,
                              //   ),
                              //   suffixIcon: influencerController.searchController.text.isNotEmpty
                              //       ? GestureDetector(
                              //           onTap: () {
                              //             influencerController.searchController.clear();
                              //             influencerController.pagingController.refresh();
                              //             FocusScope.of(context).unfocus();
                              //           },
                              //           child: const Icon(
                              //             Icons.clear_outlined,
                              //           ),
                              //         )
                              //       : const Offstage(),
                              // ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white, // Background color
                                hintText: 'Search',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none, // No border
                                ),
                                prefixIcon: const Icon(Icons.search, color: Colors.grey), // Search icon color
                              ),
                              controller: searchController.searchTextController,
                              onChanged: (value) => searchController.searchDebounce(value),
                            ),
                          ),
                        )),
                    const SizedBox(height: 20),
                    // Expanded(
                    //    child:
                    //: state.searchState == RequestState.loading
                    //     ? Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : state.searchState == RequestState.loaded
                    //         ?
                    PagedListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        pagingController: searchController.pagingController,
                        // state.searchMovies.length,
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder: (context, dynamic item, index) {
                            // final movie = state.searchMovies[index];
                            return Container(
                              padding: const EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder:
                                      //         (BuildContext context) =>
                                      //             MovieDetailScreen(
                                      //                 id: movie.id),
                                      //   ),
                                      // );
                                    },
                                    child: SizedBox(
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: item["animeImg"] ?? AppConstants.imageUrl,
                                          //AppConstant.imageUrl(
                                          // movie.posterPath.isEmpty
                                          //     ? '/6aU58nbrPXECyVEfa8i4i5iW2OG.jpg'
                                          //     : movie.posterPath,
                                          //),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 18.0),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["animeTitle"],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(Icons.star, color: Colors.amber, size: 16.0),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  // (movie.voteAverage / 2)
                                                  //     .toStringAsFixed(1),
                                                  "vote",
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                SizedBox(width: 4.0),
                                                Text(
                                                  "89",
                                                  // '(${movie.voteAverage})',
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 10.0),
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                                horizontal: 8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red[400],
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              child: const Text(
                                                "date",
                                                // movie.releaseDate
                                                // .split('-')[0],
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          item["synopsis"],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ))
                    // : Container(),
                    // )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
