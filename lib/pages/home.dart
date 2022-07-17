import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../components/choose_pad.dart';
import '../provider.dart';
import "package:kontimer/theme.dart";

class KonTimerHome extends StatelessWidget {
  const KonTimerHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryClr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              height: MediaQuery.of(context).size.height * 0.65,
              child: const Card(
                shape: roundedborders,
                color: primaryClr,
                child: ChoosePad(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              onPressed: () {
                Provider.of<TimerBack>(context, listen: false)
                    .startButtonFunc();
              },
              style: buttonStyle(secondaryColor, context),
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}
