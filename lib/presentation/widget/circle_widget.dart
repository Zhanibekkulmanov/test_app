import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxPainter extends CustomPainter {
  final bool isChecked;
  final Color checkboxColor;
  CheckboxPainter({required this.isChecked, required this.checkboxColor});

  @override
  void paint(Canvas canvas, Size size) {

    var paintingStyle = PaintingStyle.stroke;

    if(isChecked) {
      paintingStyle = PaintingStyle.fill;
    } else {
      paintingStyle = PaintingStyle.stroke;
    }

    final paint = Paint()
      ..color = checkboxColor
      ..style = paintingStyle
      ..strokeWidth = 2.0;

    final rect = Rect.fromPoints(
      const Offset(2, 2),
      Offset(size.width - 2, size.height - 2),
    );

    canvas.drawCircle(
      rect.center,
      rect.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}