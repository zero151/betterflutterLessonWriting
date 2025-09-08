import 'dart:math';

import 'package:flutter/material.dart';

class RadiusPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadiusPercentWidget({super.key, 
  required this.child, 
  required this.percent, 
  required this.fillColor, 
  required this.lineColor, 
  required this.freeColor, 
  required this.lineWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(child: child),
        )
      ],
    );
  }
}

class MyPainter extends CustomPainter{
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({super.repaint, 
  required this.percent, 
  required this.fillColor, 
  required this.lineColor, 
  required this.freeColor, 
  required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    Paint feelPaint1 = Paint();
    feelPaint1.color = lineColor; 
    feelPaint1.style = PaintingStyle.stroke;
    feelPaint1.strokeWidth = lineWidth;
    feelPaint1.strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, -pi / 2, pi * 2 * percent, false, feelPaint1);
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    Paint freePaint = Paint();
    freePaint.color = freeColor; 
    freePaint.style = PaintingStyle.stroke;
    freePaint.strokeWidth = lineWidth;
    canvas.drawArc(arcRect, pi * 2 * percent - pi /2, pi * 2 * (1.0 - percent), false, freePaint);
  }

  void drawBackground(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint();
    backgroundPaint.color = fillColor; 
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);
  }

  Rect calculateArcsRect(Size size) {
    final linaMargin = 3;
    final offset = lineWidth / 2 + linaMargin;
    final arcRect = Offset(offset,offset) & Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}