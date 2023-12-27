import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fox_anime/components/popular.dart';
import 'package:fox_anime/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Offset tapPosition = Offset.zero;
    return Scaffold(
      body: SafeArea(
          top: true,
          bottom: true,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: FadeIn(
                    duration: const Duration(milliseconds: 500),
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
                        imageUrl: AppConstants.imageUrl,
                        fit: BoxFit.cover,
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
                        Text("title",
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
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                "falana",
                                style: const TextStyle(
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
                                Text(
                                  'voteAverage',
                                  style: const TextStyle(
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
                        GestureDetector(
                          onLongPress: () {
                            // Show custom context menu
                            final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                            showMenu(
                              context: context,
                              position: RelativeRect.fromRect(
                                tapPosition & const Size(40, 40), // smaller rect, the touch area
                                Offset.zero & overlay.size,
                              ),
                              items: [
                                const PopupMenuItem(
                                  value: 'copy',
                                  child: Text('Copy'),
                                ),
                                const PopupMenuItem(
                                  value: 'select-all',
                                  child: Text('Select All'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                                const PopupMenuItem(
                                  value: 'open-with',
                                  child: Text('Open with...'),
                                )
                              ],
                            ).then<void>((Object? newValue) {
                              // Handle menu selection
                              if (newValue == null) {
                                return;
                              }
                              if (newValue == 'copy') {
                                Clipboard.setData(
                                  const ClipboardData(
                                    text: "state.movieDetails!.overview",
                                  ),
                                );
                              }
                              if (newValue == 'select-all') {
                                // Select all text
                                // ...
                              }
                            });
                          },
                          child: const SelectableText(
                            "overview",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                            showCursor: true,
                            cursorWidth: 2,
                            cursorColor: Colors.red,
                            cursorRadius: Radius.circular(5),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          "Using the Movies application is straightforward. Once you've installed it on your device, launch the appUsing the Movies application is straightforward. Once you've installed it on your device, launch the app",
                          style: TextStyle(
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
                      'Videos',
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
                child: PopularMovie(),
              ),
            ],
          )),
    );
  }
}
