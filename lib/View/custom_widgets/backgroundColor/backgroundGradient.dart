import 'package:flutter/material.dart';

BoxDecoration BackgroundGradient() {
  return const BoxDecoration(
      // color: Color.fromARGB(174, 158, 158, 158),
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    colors: [
      Colors.blue,
      Colors.white,
      Colors.white,
      Colors.blue,
    ],
    stops: [
      0.001,
      0.4,
      0.6,
      2,
    ],
  ));
}
