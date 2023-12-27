import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovie extends StatelessWidget {
  const PopularMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // BlocBuilder<MovieBloc, MovieState>(
        //   buildWhen: (previous, current) =>
        //       previous.popularState != current.popularState,
        //   builder: (context, state) {
        // switch (state.popularState) {
        //   case RequestState.loading:
        //     return SizedBox(
        //       height: 170.0,
        //       child: Center(
        //         child: CircularProgressIndicator(
        //           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        //           strokeWidth: 2.0,
        //         ),
        //       ),
        //     );
        //   case RequestState.loaded:
        //    return

        FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: 6,
          // itemCount: state.popularMovies.length,
          itemBuilder: (context, index) {
            //final movie = state.popularMovies[index];
            return Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         MovieDetailScreen(id: movie.id),
                  //   ),
                  // );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: CachedNetworkImage(
                    width: 120.0,
                    fit: BoxFit.cover,
                    imageUrl: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                    // imageUrl: AppConstant.imageUrl(movie.posterPath),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    // case RequestState.error:
    //   return SizedBox(
    //     height: 170.0,
    //     child: Center(
    //       child: Text(state.popularMessage),
    //     ),
    //   );
    //}
    //   },
    // );
  }
}
