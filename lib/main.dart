import "package:flutter/material.dart";
import 'package:kontimer/provider.dart';
import 'package:provider/provider.dart';
import "package:get/get.dart";


import 'pages/home.dart';

main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TimerBack(),
      child: const KonTimer(),
    ),
  );
}



class KonTimer extends StatelessWidget {
  const KonTimer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: KonTimerHome(),
    );
  }
}
