import "package:flutter/material.dart";

import "package:provider/provider.dart";
import "../provider.dart";

import '../theme.dart';
import 'change_time_button.dart';

class ChoosePad extends StatelessWidget {
  const ChoosePad({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hours",
                style: wordsStyle,
              ),
              const ChangeTimeButton(
                isup: true,
                name: "hoursLeft",
              ),
              Consumer<TimerBack>(
                builder: (BuildContext context, time, _) {
                  return Text(
                    "${time.hoursLeft}",
                    style: numbersStyle,
                  );
                },
              ),
              const ChangeTimeButton(
                isup: false,
                name: "hoursLeft",
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Minutes",
                style: wordsStyle,
              ),
              const ChangeTimeButton(isup: true, name: "minutesLeft"),
              Consumer<TimerBack>(builder: (BuildContext context, time, _) {
                return Text(
                  "${time.minutesLeft}",
                  style: numbersStyle,
                );
              }),
              const ChangeTimeButton(isup: false, name: "minutesLeft"),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Seconds",
                style: wordsStyle,
              ),
              const ChangeTimeButton(
                isup: true,
                name: "secondsLeft",
              ),
              Consumer<TimerBack>(
                builder: (BuildContext context, time, _) {
                  return Text(
                    "${time.secondsLeft}",
                    style: numbersStyle,
                  );
                },
              ),
              const ChangeTimeButton(
                isup: false,
                name: "secondsLeft",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
