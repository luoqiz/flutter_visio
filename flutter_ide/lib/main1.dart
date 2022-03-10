import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ide/simple_2D_canvas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Padddd(),
    );
  }
}

class Padddd extends StatefulWidget {
  const Padddd({Key? key}) : super(key: key);

  @override
  _PaddddState createState() => _PaddddState();
}

class _PaddddState extends State<Padddd> {

  double zoom = 1.0;
  Offset position = Offset.zero;

  static const double _MIN_ZOOM = 0.02;
  static const double _MAX_ZOOM = 4;

  void onPanUpdate(DragUpdateDetails details) {
    print(zoom);
    print(details);
    print(position);
    setState(() {
      // Correct for zooming
      Offset movement = details.delta / zoom;
      // position -= movement;
      position = position+Offset(100,100);
      _left += details.delta.dx;
      _top += details.delta.dy;
    });

  }

  void _receivedPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      //final double targetScrollOffset = _targetScrollOffsetForPointerScroll(event);
      GestureBinding.instance?.pointerSignalResolver.register(event, _handlePointerScroll);
    }
  }

  void _handlePointerScroll(PointerEvent event) {
    assert(event is PointerScrollEvent);
    var scrollEvent = event as PointerScrollEvent;
    double zoomDelta = (-scrollEvent.scrollDelta.dy / 300);
    if(zoom + zoomDelta > _MIN_ZOOM && zoom + zoomDelta < _MAX_ZOOM) {
      setState(() {
        zoom += zoomDelta;
      });
    }

  }

  late BuildContext context;
  double _left=50.0;
  double _top=220.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _receivedPointerSignal,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        //onScaleUpdate: onScrollUpdate,

        onPanUpdate: onPanUpdate,
        onPanStart: (_) {},
        onPanEnd: (_) {},
        child: Material(
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: Listener(
            onPointerDown: (d) {
              //var renderBox = this.context.findRenderObject() as RenderBox;
              //var result = BoxHitTestResult();
              //renderBox.handleEvent(event, entry)
            },
            child: Transform.scale(
              scale: zoom,
              alignment: Alignment.center,
              child: Builder(
                  builder: (context) {
                    this.context = context;
                    return Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        Positioned(
                          left: _left,
                          top: _top,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.orange,
                            alignment: Alignment.center,
                            child: Text("Jimi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  Map<String, CanvasWidget> map = {
    "1": CanvasWidget(
      position: const Offset(30, 30),
      size: const Size(100, 100),
      child: Container(
        color: Colors.amberAccent,
        child: Text("homepage"),
      ),
    )
  };

  double _left = 0;
  double _top = 0;
  double _widthAndHeight = 200;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: themeData,
      home: Builder(builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 0.8,
            devicePixelRatio: 11,
          ),
          child: Scaffold(
            body:Center(
              child: Stack(
                children: [
                  /// 缩放手势
                  GestureDetector(
                    onScaleEnd: (details) {
                      print("onScaleEnd---${details.velocity}---${details.pointerCount}");
                    },
                    onScaleStart: (details) {
                      print("onScaleStart---${details.focalPoint}---${details.pointerCount}");
                    },
                    onScaleUpdate: (details) {
                      print("onScaleUpdate---${details.scale}---${details.scale.clamp(0.1, 1.2)}");

                    },
                    child: Container(
                      width: _widthAndHeight,
                      height: _widthAndHeight,
                      color: Colors.orange,
                      alignment: Alignment.center,
                      child: Text("Jimi",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      }),
    );
  }

// Widget _test1(){
//   return  Row(
//     children: [
//       Container(
//         width: 300,
//         height: double.infinity,
//         color: Colors.black12,
//         child: const Text("data"),
//       ),
//       Expanded(
//         child: Stack(
//           children: [
//             Listener(
//               child: Transform(
//                 transform: Matrix4.identity()
//                   ..translate(_offset.dx, _offset.dy)
//                   ..scale(_scale, _scale),
//                 child: Center(
//                   child: Container(
//                     color: Colors.green,
//                     height: 200,
//                     width: 200,
//                     child: MyRenderBox(
//                       child: const FlutterLogo(
//                         size: 88,
//                       ),
//                     ),
//                   ),
//                 ),
//                 alignment: Alignment.center,
//               ),
//             ),
//             // 使用 Transform 包裹 child ，以便进行平移和缩放处理
//
//
//           ],
//         ),
//       )
//     ],
//   );
// }
}

class MyRenderBox extends SingleChildRenderObjectWidget {
  const MyRenderBox({Key? key, required Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
}

class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    print(
        "constraintsconstraintsconstraintsconstraintsconstraintsconstraintsconstraintsconstraintsco"
            "nstraintsconstraintsconstraintsconstraintsconstraintsconstraints");
    print(constraints);
    child!.layout(constraints);
    size = Size(200, 200);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
  }
}
