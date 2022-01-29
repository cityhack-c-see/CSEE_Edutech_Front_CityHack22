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

//In the past, when students ask the teachers questions online. Students always try so hard to explain by his words, and teachers also try his best to answer only by words. However, these difficulties can now be solved. \n Droom provides you a platform to teach, with better interation. \n For teacher,n the paper, at the same time, you explain the idea on voice chat. Most importantly, You can now interact with your student by looking at what they are writing on their own paper"
