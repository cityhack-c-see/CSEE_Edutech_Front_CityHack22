import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '/draw/signature_painter.dart';
import '/draw/draw_provider.dart';


class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  // ignore: unused_field
  DrawProvider _provider = DrawProvider();

  @override
  void initState() {
    super.initState();
    _provider.connect();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: _provider,
        child: Consumer<DrawProvider>(
          builder: (context,drawProvider,_){
            return Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                        children: [
                          Text(
                            drawProvider.points.length.toString(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            ),
                          Expanded(
                            child: GestureDetector(
                              onPanUpdate: (DragUpdateDetails details){
                                // final RenderObject? referenceBox = context.findRenderObject();
                                // dynamic localposition = referenceBox.globalToLocal(details.globalPosition);
                                final container = context.findRenderObject() as RenderBox;
                                Offset localposition  = container.localToGlobal(details.globalPosition);
                                drawProvider.sendDraw(localposition);
                              },
                              onPanEnd: (DragEndDetails details){
                                
                                drawProvider.pointsList = [drawProvider.pointsList.last,drawProvider.pointsList.last];
                                drawProvider.sendDrawNull();  //pen up
                              },
                            ),
                          ),
                          Expanded(
                            child: CustomPaint(
                              painter: SignaturePainter(drawProvider.pointsList),
                            ),
                          ),
                          ],
                      ),
                      ),
                          Padding(
                            padding: EdgeInsets.only(left: 10,right: 80, bottom: 20),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: <Widget>[
                                  buildInkWell(drawProvider, 5),
                                  buildInkWell(drawProvider, 8),
                                  buildInkWell(drawProvider, 10),
                                  buildInkWell(drawProvider, 15),
                                  buildInkWell(drawProvider, 17),
                                  buildInkWell(drawProvider, 20)
                                ]),
                            ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 80,bottom: 20),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: pintColor.keys.map((key){
                                Color value = pintColor[key] as Color;
                                return InkWell(
                                  onTap: (){
                                      drawProvider.pentColor = key;
                                      drawProvider.notifyListeners();
                                  },
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    color: value,
                                    child: drawProvider.pentColor == key?
                                    // ignore: prefer_const_constructors
                                    Icon(
                                      Icons.done,
                                      color: Colors.white)
                                      :
                                      null
                                    ),
                                );
                              }).toList(),
                            ),
                          ),
                ]
        );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _provider.clear,
        tooltip: '',
        child: Icon(Icons.clear)
        ),
    );
  }
  
  InkWell buildInkWell(DrawProvider drawProvider, double size) {
    return InkWell(
      onTap: () {
        drawProvider.pentSize = size;
        drawProvider.notifyListeners();
      },
      child: Container(
        width: 40,
        height: 40,
        child: Center(
          child: Container(
            // ignore: unnecessary_new
            decoration: new BoxDecoration(
              color: pintColor[drawProvider.pentColor],
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              border: drawProvider.pentSize == size
                  ? Border.all(width: 1, color: Colors.black)
                  : null,
            ),
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _provider.dispose();
    super.dispose();
  }
}