import 'dart:async';

import "package:flutter/material.dart";
import 'package:audioplayers/audioplayers.dart';
import "package:get/get.dart";

import 'pages/counting_page.dart';


class TimerBack with ChangeNotifier {
  int hoursLeft = 0;
  int minutesLeft = 0;
  int secondsLeft = 0;
  bool started = false;
  bool paused = false;
  bool canceled = false;
  int totalSteps = 0;
  final _player2 = AudioPlayer();

  void pausefunc() {
    paused = !paused;
    notifyListeners();
  }

  void cancelfunc() async {
    canceled = true;
    totalSteps = 0;
    hoursLeft = 0;
    minutesLeft = 0;
    secondsLeft = 0;
    paused = false;
    started = false;
    await _player2.stop();
    Get.back();
    notifyListeners();
  }

  void startCountDown() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (canceled == true) {
        timer.cancel();
        notifyListeners();
      } else if (hoursLeft > 0 &&
          minutesLeft == 0 &&
          secondsLeft == 0 &&
          paused == false) {
        hoursLeft--;
        minutesLeft = 59;
        secondsLeft = 59;
        notifyListeners();
      } else if (minutesLeft > 0 && secondsLeft == 0 && paused == false) {
        minutesLeft--;
        secondsLeft = 59;
        notifyListeners();
      } else if (secondsLeft > 0 && paused == false) {
        secondsLeft--;
        notifyListeners();
      } else if (paused == true) {
      } else {
        await _player2.setReleaseMode(ReleaseMode.loop);
        await _player2.play(AssetSource("sounds/sound1.mp3"));
        timer.cancel();
        paused = false;
        canceled = false;
        notifyListeners();
      }
    });
  }

  void changeTimeFunc(bool isup, String name) {
    if (isup == true) {
      // dont forget to make the maximum hours = 100
      if (name == "hoursLeft" && hoursLeft < 100) {
        hoursLeft++;
        totalSteps += 3600;
      } else if (name == "minutesLeft" && minutesLeft < 60) {
        // dont forget to make the maximum minutes = 60
        minutesLeft++;
        totalSteps += 60;
      } else if (name == "secondsLeft" && secondsLeft < 60) {
        // dont forget to make the maximum seconds = 60
        secondsLeft++;
        totalSteps++;
      }
    } else {
      if (name == "hoursLeft" && hoursLeft > 0) {
        hoursLeft--;
        totalSteps -= 3600;
      } else if (name == "minutesLeft" && minutesLeft > 0) {
        minutesLeft--;
        totalSteps -= 60;
      } else if (name == "secondsLeft" && secondsLeft > 0) {
        secondsLeft--;
        totalSteps--;
      }
    }
    notifyListeners();
  }

  void startButtonFunc() {
    if (hoursLeft == 0 && minutesLeft == 0 && secondsLeft == 0) {
    } else {
      startCountDown();
      canceled = false;
      started = true;
      Get.to(() => const CountingPage());
    }
  }

  bool navigateToCountingPage() {
    if (hoursLeft == 0 && minutesLeft == 0 && secondsLeft == 0) {
      return false;
    } else {
      return true;
    }
  }

  bool isItDone() {
    if (hoursLeft == 0 && minutesLeft == 0 && secondsLeft == 0) {
      return true;
    } else {
      return false;
    }
  }
}
