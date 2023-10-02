import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerPainter extends CustomPainter {

  final BorderRadius borderRadius;
  final Color? randomColor;

  ContainerPainter({required this.borderRadius,this.randomColor,});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = randomColor ?? Colors.tealAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rRect = borderRadiusToRRect(borderRadius, size);
    final path = Path()
      ..addRRect(rRect);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

RRect borderRadiusToRRect(BorderRadius borderRadius, Size size) {
  return RRect.fromRectAndCorners(
    Rect.fromLTWH(0, 0, size.width, size.height),
    topLeft: borderRadius.topLeft,
    topRight: borderRadius.topRight,
    bottomLeft: borderRadius.bottomLeft,
    bottomRight: borderRadius.bottomRight,
  );
}