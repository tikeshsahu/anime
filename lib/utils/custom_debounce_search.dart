import 'dart:async';

import 'package:flutter/material.dart';

class CustomDebounce {
  final int milliseconds;
  Timer? _timer;

  CustomDebounce({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
