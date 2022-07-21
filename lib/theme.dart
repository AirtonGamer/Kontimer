import "package:flutter/material.dart";

const Color primaryClr = Color.fromRGBO(18, 18, 18, 0);

const Color secondaryColor = Color.fromRGBO(187, 134, 252, 1);

const Color white = Colors.white;

const RoundedRectangleBorder roundedborders = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
);

TextStyle get numbersStyle {
  return const TextStyle(
    color: white,
    fontSize: 25,
  );
}

TextStyle get wordsStyle {
  return const TextStyle(
    color: white,
    fontSize: 15,
  );
}

buttonStyle(Color buttonClr, BuildContext context) {
  return ElevatedButton.styleFrom(
    primary: buttonClr,
    fixedSize: Size(MediaQuery.of(context).size.width * 0.15,
        MediaQuery.of(context).size.height * 0.10),
    shape: roundedborders,
  );
}
