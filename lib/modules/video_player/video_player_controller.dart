import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class VideoPlayerCController extends GetxController {
  //setters
  final RxInt _currentIndex = RxInt(0);
  late TargetPlatform _platform;
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  late ChewieController _chewieController;
  final RxBool _readyToShow = RxBool(false);

  // getters
  int get currentIndex => _currentIndex.value;
  dynamic get platform => _platform;
  VideoPlayerController get videoPlayerController1 => _videoPlayerController1;
  VideoPlayerController get videoPlayerController2 => _videoPlayerController2;
  ChewieController get chewieController => _chewieController;
  bool get readyToShow => _readyToShow.value;

  @override
  Future<void> onInit() async {
    initializePlayer();
    if (Platform.isIOS) {
      _platform = TargetPlatform.iOS;
    } else {
      _platform = TargetPlatform.android;
    }
    super.onInit();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  updateReadyToShow(bool value) {
    _readyToShow.value = value;
    update();
  }

  List<String> srcs = [
    "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4", 
    "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"];
     

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
    _videoPlayerController2 = VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
    await Future.wait([_videoPlayerController1.initialize(), _videoPlayerController2.initialize()]);
    _createChewieController();
    updateReadyToShow(true);
  }

  void _createChewieController() {
    // final subtitles = [
    //     Subtitle(
    //       index: 0,
    //       start: Duration.zero,
    //       end: const Duration(seconds: 10),
    //       text: 'Hello from subtitles',
    //     ),
    //     Subtitle(
    //       index: 0,
    //       start: const Duration(seconds: 10),
    //       end: const Duration(seconds: 20),
    //       text: 'Whats up? :)',
    //     ),
    //   ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      // progressIndicatorDelay: bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      // subtitle: Subtitles(subtitles),
      // subtitleBuilder: (context, dynamic subtitle) => Container(
      //   padding: const EdgeInsets.all(10.0),
      //   child: subtitle is InlineSpan
      //       ? RichText(
      //           text: subtitle,
      //         )
      //       : Text(
      //           subtitle.toString(),
      //           style: const TextStyle(color: Colors.black),
      //         ),
      // ),

      hideControlsTimer: const Duration(seconds: 1),

      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.grey,
        handleColor: Colors.white,
        //backgroundColor: Color.fromARGB(255, 145, 142, 142),
        backgroundColor: Colors.black,
        bufferedColor: Colors.white30,
      ),
      placeholder: Container(
        color: Colors.black,
      ),
      autoInitialize: true,
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex += 1;
    if (currPlayIndex >= srcs.length) {
      currPlayIndex = 0;
    }
    await initializePlayer();
  }
}
