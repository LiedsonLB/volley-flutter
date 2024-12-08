import 'dart:async';

import 'package:flutter/material.dart';

class TimerController {
  late Timer _timer;
  int _seconds = 0;
  int _milliseconds = 0;

  ValueNotifier<String> time = ValueNotifier<String>('0:00"00"');

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      _milliseconds++;
      if (_milliseconds >= 100) {
        _milliseconds = 0;
        _seconds++;
      }
      time.value = _formatTime(_seconds, _milliseconds);
    });
  }

  String _formatTime(int seconds, int milliseconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}"${milliseconds.toString().padLeft(2, '0')}';
  }

  void stopTimer() {
    _timer.cancel();
  }
}
