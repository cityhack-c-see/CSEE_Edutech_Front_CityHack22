import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom:10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        color: Colors.black12,
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
                              fontFamily: 'Mochiy',
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Flexible(
                          flex: 2,
                            child: Text(
                                "For Teacher:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "1. CREATE your room\n2. DRAW on your paper \n3. EXPLAIN by talking\n4. GET feedbacks from student's writing \n5. INTERACT with students",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                          child: Text(
                            'For Students:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "1. LOOK at Teacher's Paper\n2.LISTEN to the teacher\n3.DRAW out your questions\n4. GIVE feedbacks ",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                    onPressed: (){},
                    child: Text("create"),
                  )
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                      onPressed: (){},
                      child: Text("Join"),
                    )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

