//import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:kontimer/provider.dart';
import 'package:provider/provider.dart';
import "package:get/get.dart";
//import 'package:window_size/window_size.dart';
//import 'dart:io';


import 'pages/home.dart';

main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TimerBack(),
      child: const KonTimer(),
    ),
  );
}

// const double windowWidth = 360;
// const double windowHeight = 640;

// void setupWindow() {
//   if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
//     WidgetsFlutterBinding.ensureInitialized();
//     setWindowTitle('Provider Counter');
//     setWindowMinSize(const Size(windowWidth, windowHeight));
//     setWindowMaxSize(const Size(windowWidth, windowHeight));
//     getCurrentScreen().then((screen) {
//       setWindowFrame(Rect.fromCenter(
//         center: screen!.frame.center,
//         width: windowWidth,
//         height: windowHeight,
//       ));
//     });
//   }
// }



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
