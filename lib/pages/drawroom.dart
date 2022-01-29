import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class DrawRoom extends StatefulWidget {
  const DrawRoom({Key key}) : super(key: key);

  @override
  _DrawRoomState createState() => _DrawRoomState();
}

class _DrawRoomState extends State<DrawRoom> {
  var args;
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null) {
      args = arguments["roomid"];
    }
    if (arguments["create_room"] == "FaLsE") {
      try {
        var response = dio.get("http://14.198.186.160:5000/api/room" + args) as Response;
        var responseBody = response;
        inspect(response);
        print(responseBody);
      } on DioError catch (e) {
        print(e.response.statusCode);
      }
    } else if (arguments["create_room"] == "TrUe") {
      try {
        // Create
        var response = dio.post("http://14.198.186.160:5000/api/room") as Response;
        var responseBody = response;
        inspect(response);
        print(responseBody);
      } on DioError catch (e) {
        print(e.response.statusCode);
      }
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
