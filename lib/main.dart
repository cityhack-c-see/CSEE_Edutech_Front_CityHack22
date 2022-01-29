import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/drawroom.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/drawroom': (context) => DrawRoom(),
    },
  ));
}
