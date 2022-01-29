import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:droom_flutter/draw/draw_entity.dart';
import 'package:droom_flutter/draw/signature_painter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

Map<String, Color> pintColor = {
  'default': Colors.indigo,
  'black': Colors.black,
  'brown': Colors.brown,
  'gray': Colors.grey,
  'blueGrey': Colors.blueGrey,
  'blue': Colors.blue,
  'cyan': Colors.cyan,
  'deepPurple': Colors.deepPurple,
  'orange': Colors.orange,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'pink': Colors.pink,
  'teal': Colors.teal,
  'red': Colors.red,
  'purple': Colors.purple,
  'blueAccent': Colors.blueAccent,
  'white': Colors.white,
};

class DrawProvider with ChangeNotifier {
  final String _url = 'ws://10.10.3.55:8080/mini';

  List<List<DrawEntity>> undoPoints = <List<DrawEntity>>[];
  List<List<DrawEntity>> points = <List<DrawEntity>>[];
  List<DrawEntity> pointsList = <DrawEntity>[];
  String pentColor = "default";
  double pentSize = 5;
  late WebSocketChannel _channel;

  connect() {
    _socketConnect();
  }

  _socketConnect() {
    _channel = IOWebSocketChannel.connect(_url);
    _channel.stream.listen(
      (message) {
        print("$message");
        message = jsonDecode(message);
        if (message["type"] == "sendDraw") {
          if (points.isEmpty) {
            points.add(<DrawEntity>[]);
            points.add(<DrawEntity>[]);
          }
          pentColor = message["pentColor"];
          pentSize = message["pentSize"];

          points[points.length - 2].add(DrawEntity(
              Offset(message["dx"], message["dy"]),
              color: pentColor,
              strokeWidth: pentSize));
          setState();
        } else if (message["type"] == "sendDrawNull") {
          points.add(<DrawEntity>[]);
          setState();
        } else if (message["type"] == "clear") {
          points.clear();
          setState();
        }
      },
      onDone: () {
        _socketConnect();
      },
      onError: (err) {
        print("This is a feature, not a bug");
      },
      cancelOnError: true,
    );
  }

  clear() {
    points.clear();
    setState();
    _channel.sink
        .add(jsonEncode({
          'uuid': 'xxxx',
          'type': 'clear',
          'msg': 'clear'}));
  }

  sendDraw(Offset localPosition) {
    if (points.isEmpty) {
      points.add(<DrawEntity>[]);
      points.add(<DrawEntity>[]);
    }

    points[points.length - 2].add(
        DrawEntity(localPosition, color: pentColor, strokeWidth: pentSize));

    setState();

    _channel.sink.add(jsonEncode({
      'uuid': 'xxxx',
      'type': 'sendDraw',
      'pentColor': pentColor,
      'pentSize': pentSize,
      "dx": localPosition.dx,
      "dy": localPosition.dy
    }));
  }

  sendDrawNull() {
    points.add(<DrawEntity>[]);
    setState();
    _channel.sink.add(jsonEncode({
      'uuid': 'xxxx',
       'type': 'sendDrawNull'}
       ));
  }

  undoDate() {
    undoPoints.add(points[points.length - 3]);
    points.removeAt(points.length - 3);
    setState();
    _channel.sink.add(jsonEncode({'uuid': 'xxxx', 'type': 'sendDrawUndo'}));
  }

  reverseUndoDate() {
    List<DrawEntity> ss = undoPoints.removeLast();
    points.insert(points.length - 2, ss);

    setState();
    _channel.sink.add(jsonEncode({'uuid': 'xxxx', 'type': 'reverseUndoDate'}));
  }

  @override
  void dispose() {
    _channel.sink?.close();
    super.dispose();
  }

  _update() {
    pointsList = <DrawEntity>[];
    for (int i = 0; i < points.length - 1; i++) {
      pointsList.addAll(points[i]);
      //pointsList.add();
    }
  }

  setState() {
    _update();
    notifyListeners();
  }
}
