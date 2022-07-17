import "package:flutter/material.dart";
import "package:kontimer/provider.dart";
import 'package:provider/provider.dart';

class ChangeTimeButton extends StatelessWidget {
  const ChangeTimeButton({
    Key? key,
    required this.isup,
    required this.name,
  }) : super(key: key);

  final bool isup;
  final String name;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isup == true
          ? const Icon(Icons.arrow_drop_up)
          : const Icon(Icons.arrow_drop_down),
      iconSize: 75,
      onPressed: () => Provider.of<TimerBack>(context, listen: false)
          .changeTimeFunc(isup, name),
    );
  }
}
