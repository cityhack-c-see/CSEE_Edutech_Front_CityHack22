import 'package:flutter/widgets.dart';


class DrawEntity {
  Offset offset;
  String color;
  double strokeWidth;
  
  DrawEntity( this.offset ,{  this.color = "default",  this.strokeWidth = 5.0});
  //bool? create(DrawEntity other) => other == null;
}