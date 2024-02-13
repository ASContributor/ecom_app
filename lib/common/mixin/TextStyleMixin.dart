import 'package:flutter/material.dart';

mixin TextMixin {
  TextStyle headingTextStyle() {
    return const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  TextStyle bodyTextStyle() {
    return const TextStyle(
      fontSize: 16.0,
      color: Colors.grey,
    );
  }
}
