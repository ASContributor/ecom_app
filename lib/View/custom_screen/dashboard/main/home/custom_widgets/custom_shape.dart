import 'package:flutter/material.dart';

class CustomeShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    // -----------------------------------
    final firstPoint = Offset(0, size.height - 30);
    final firstlastPoint = Offset(40, size.height - 30);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, firstlastPoint.dx, firstlastPoint.dy);

    // ---------------------------------
    final secondPoint = Offset(0, size.height - 30);
    final secondlastPoint = Offset(size.width - 40, size.height - 30);
    path.quadraticBezierTo(secondPoint.dx, secondlastPoint.dy,
        secondlastPoint.dx, secondlastPoint.dy);

// ------------------------------
    final ThirdPoint = Offset(size.width, size.height - 30);
    final ThirdlastPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        ThirdPoint.dx, ThirdPoint.dy, ThirdlastPoint.dx, ThirdlastPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
