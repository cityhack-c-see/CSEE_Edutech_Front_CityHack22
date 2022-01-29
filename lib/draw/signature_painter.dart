import 'package:flutter/material.dart';
import '/draw/draw_entity.dart';
import '/draw/draw_provider.dart';

class SignaturePainter extends CustomPainter  {
  List<DrawEntity> pointsList;
  late Paint pt;
  SignaturePainter(this.pointsList){
    pt = Paint()
      ..color = pintColor['default'] as Color 
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.bevel;
  }
  void paint (Canvas canvas,Size size){
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        // ignore: avoid_single_cascade_in_expression_statements
        pt
          ..color = pintColor[pointsList[i].color] as Color
          ..strokeWidth = pointsList[i].strokeWidth;

        canvas.drawLine(pointsList[i].offset, pointsList[i + 1].offset, pt);
      }
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.pointsList != pointsList;
}