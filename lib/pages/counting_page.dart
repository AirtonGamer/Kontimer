import 'package:flutter/material.dart';
import 'package:kontimer/provider.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../theme.dart';

class CountingPage extends StatelessWidget {
  const CountingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<TimerBack>(builder: (_, timer, __) {
              return CircularPercentIndicator(
                percent: ((Provider.of<TimerBack>(context).hoursLeft * 60 * 60)
                            .toDouble() +
                        (Provider.of<TimerBack>(context).minutesLeft * 60)
                            .toDouble() +
                        (Provider.of<TimerBack>(context).secondsLeft)
                            .toDouble()) /
                    Provider.of<TimerBack>(context).totalSteps.toDouble(),
                radius: 175,
                progressColor: secondaryColor,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Consumer<TimerBack>(
                      builder: (BuildContext context, time, _) {
                        return Text(
                          "${time.hoursLeft}:",
                          style: numbersStyle,
                        );
                      },
                    ),
                    Consumer<TimerBack>(
                      builder: (BuildContext context, time, _) {
                        return Text(
                          "${time.minutesLeft}:",
                          style: numbersStyle,
                        );
                      },
                    ),
                    Consumer<TimerBack>(
                      builder: (BuildContext context, time, _) {
                        return Text(
                          "${time.secondsLeft}",
                          style: numbersStyle,
                        );
                      },
                    ),
                  ],
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<TimerBack>(builder: (_, timer, __) {
                  return ElevatedButton(
                    onPressed: timer.isItDone() == true
                        ? null
                        : () {
                            Provider.of<TimerBack>(context, listen: false)
                                .pausefunc();
                          },
                    style: buttonStyle(
                      timer.paused == false
                          ? const Color.fromRGBO(63, 81, 181, 1)
                          : const Color.fromARGB(255, 102, 200, 105),
                      context,
                    ),
                    child: Consumer<TimerBack>(
                        builder: (BuildContext context, text, child) {
                      return Text(text.paused == false ? "Pause" : "Contuine");
                    }),
                  );
                }),
                ElevatedButton(
                  style: buttonStyle(Colors.red, context),
                  child: const Text("Cancel"),
                  onPressed: () {
                    Provider.of<TimerBack>(context, listen: false).cancelfunc();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
