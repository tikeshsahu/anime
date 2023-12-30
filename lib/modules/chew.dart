import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fox_anime/components/popular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class ChewieDemo extends StatefulWidget {
  const ChewieDemo({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController;
  int? bufferDelay;

  


  @override
  Widget build(BuildContext context) {
    return

        // AppTheme.light.copyWith(
        //   platform: _platform ?? Theme.of(context).platform,
        // ),
        Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            
           
          ],
        ),
      ),
    );
  }
}

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(secondary: Colors.red),
    disabledColor: Colors.grey.shade400,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(secondary: Colors.red),
    disabledColor: Colors.grey.shade400,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
