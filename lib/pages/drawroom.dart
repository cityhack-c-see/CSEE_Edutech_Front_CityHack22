import 'package:flutter/material.dart';

class DrawRoom extends StatefulWidget {
  const DrawRoom({Key? key}) : super(key: key);

  @override
  _DrawRoomState createState() => _DrawRoomState();
}

class _DrawRoomState extends State<DrawRoom> {
  var args;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null) {
      args = arguments["roomid"];
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Text("Room ID: ${args}"),
                )
            ),
            Expanded(
              flex: 14,
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: (){},
                ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 14,
                child: MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: (){

                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
