import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final bool _SerIsReady = true;
  bool loading = false;
  final _controllerID = TextEditingController();
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            home: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/pen-pattern-background.jpeg"),
                      fit: BoxFit.cover),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white54,
                                boxShadow: [
                                  BoxShadow(
                                    blurStyle: BlurStyle.inner,
                                    color: Colors.black87,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "Welcome to Droom！",
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            fontFamily: 'Mochiypop',
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Spacer(flex: 2),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Flexible(
                                            flex: 2,
                                            child: Text(
                                              "For Teacher:",
                                              style: TextStyle(
                                                  fontFamily: 'Mochiypop',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "1. CREATE your room\n2. DRAW questions/explanations on paper \n3. GET feedbacks from student's writing \n4. ENJOY INTERACTION on paper!",
                                        style: TextStyle(
                                            fontFamily: 'Mochiypop',
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'For Students:',
                                          style: TextStyle(
                                            fontFamily: 'Mochiypop',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 10,
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "1. LOOK at Teacher's Paper\n2.GIVE feedbacks/answers on paper\n3.ENJOY INTERACTION on paper!",
                                        style: TextStyle(
                                            fontFamily: 'Mochiypop',
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.center,
                                    // create (for teacher)
                                    child: MaterialButton(
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      elevation: 10,
                                      onPressed: () async {
                                        //change to loading screen until server data is ready,
                                        if (_SerIsReady == false) {
                                          setState(() {
                                            loading = true;
                                          });
                                        }
                                        if (_SerIsReady == true) {
                                          setState(() {
                                            loading = false;
                                          });
                                          Navigator.pushNamed(
                                              context, '/drawroom', arguments: {
                                            "roomid": "0",
                                            "create_room": "TrUe"
                                          });
                                        }
                                      },
                                      child: Text(
                                        "create",
                                        style: TextStyle(
                                          fontFamily: 'Mochiypop',
                                        ),
                                      ),
                                    )),
                              ),
                              Flexible(
                                  flex: 5,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        flex: 4,
                                        child: MaterialButton(
                                          color: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          elevation: 10,
                                          onPressed: () async {
                                            //change to loading screen until server data is ready,
                                            if (_SerIsReady == false) {
                                              setState(() {
                                                loading = true;
                                              });
                                            }
                                            if (_SerIsReady == true) {
                                              setState(() {
                                                loading = false;
                                              });

                                              Navigator.pushNamed(
                                                  context, '/drawroom',
                                                  arguments: {
                                                    "roomid": _controllerID.text,
                                                    "create_room": "FaLsE"
                                                  });
                                            }
                                          },
                                          child: Text(
                                            "Join",
                                            style: TextStyle(
                                              fontFamily: 'Mochiypop',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(flex: 1),
                                      Flexible(
                                        flex: 10,
                                        child: AspectRatio(
                                          aspectRatio: 6 / 1,
                                          child: Material(
                                            elevation: 5,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: TextFormField(
                                              autofocus: false,
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.meeting_room,
                                                  color: Colors.blue,
                                                ),
                                                disabledBorder:
                                                    InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                hintText: 'Enter Room ID:',
                                              ),
                                              //
                                              controller: _controllerID,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Expanded(flex: 5, child: Container()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
