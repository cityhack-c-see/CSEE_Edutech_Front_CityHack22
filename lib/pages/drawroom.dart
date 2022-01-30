import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../draw/draw_page.dart';

class DrawRoom extends StatefulWidget {
  const DrawRoom({Key key}) : super(key: key);

  @override
  _DrawRoomState createState() => _DrawRoomState();
}

class _DrawRoomState extends State<DrawRoom> {
  var args,_host;

  @override
  Widget build(BuildContext context) {
    DrawPage _public;
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null) {
      args = arguments["roomid"].toString();
      _host = arguments['host'];
      _public = DrawPage(args,_host);
    }
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Text("Room ID: ${args}"),
                )),
            Expanded(
              flex: 14,
              child: Container(
                child: _public,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Spacer(flex: 1),
            Expanded(
                flex: 14,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
