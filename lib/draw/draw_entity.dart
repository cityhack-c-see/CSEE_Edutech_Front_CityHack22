import 'package:flutter/widgets.dart';


class DrawEntity {
  Offset offset;
  String color;
  double strokeWidth;
  //late DrawEntity({Key? key});
  DrawEntity( this.offset,{  this.color = "default",  this.strokeWidth = 5.0});
   
}