import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final bool _SerIsReady = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/images/pen-pattern-background.jpeg"),
              fit: BoxFit.cover
              ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom:10),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
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
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Flexible(
                              flex: 2,
                                child: Text(
                                    "For Teacher:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "1. CREATE your room\n2. DRAW questions/explanations on paper \n3. GET feedbacks from student's writing \n4. ENJOY INTERACTION on paper!",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15
                                ),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  "1. LOOK at Teacher's Paper\n2.GIVE feedbacks/answers on paper\n3.ENJOY INTERACTION on paper!",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        onPressed: (){
                          if ( _SerIsReady == true) {
                            Navigator.pushNamed(
                              context,
                              '/drawroom',
                              arguments: {"roomid": "18"}
                            );
                          }
                        },
                        child: Text("create"),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          onPressed: (){
                            if ( _SerIsReady == true) {
                              Navigator.pushNamed(
                                  context,
                                  '/drawroom',
                                  arguments: {"roomid": "18"}
                              );
                            }
                          },
                          child: Text("Join"),
                        )
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

