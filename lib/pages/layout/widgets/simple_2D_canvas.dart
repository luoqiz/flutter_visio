import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CanvasWidget {
  final Offset position;
  final Widget child;
  final Size size;

  CanvasWidget(
      {required this.position, required this.size, required this.child});
}

class Simple2DCanvas extends StatefulWidget {
  final Map<String, CanvasWidget> widgets;

  const Simple2DCanvas({Key? key, required this.widgets}) : super(key: key);

  @override
  _Simple2DCanvasState createState() => _Simple2DCanvasState();
}

class _Simple2DCanvasState extends State<Simple2DCanvas> {
  double zoom = 1.0;
  Offset position = Offset.zero;

  static const double _MIN_ZOOM = 0.02;
  static const double _MAX_ZOOM = 4;

  List<Widget> get _children {
    return widget.widgets.keys.map((key) {
      CanvasWidget it = widget.widgets[key]!;
      return Positioned(
        top: it.position.dy - position.dy,
        left: it.position.dx - position.dx,
        width: it.size.width,
        height: it.size.height,
        child: RepaintBoundary.wrap(
            wrapWithDraggable(child: it.child, ), widget.widgets.keys.toList().indexOf(key)),
      );
    }).toList() /*..insert(0, Positioned2.fill( TODO implement at some point
        child: BackgroundGrid(
          zoom: zoom,
          offset: position,
        )
    ))*/
        ;
  }

  void onPanUpdate(DragUpdateDetails details) {
    print(zoom);
    print(details);
    print(position);
    setState(() {
      // Correct for zooming
      Offset movement = details.delta / zoom;
      position -= movement;
    });
  }

  void _receivedPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      //final double targetScrollOffset = _targetScrollOffsetForPointerScroll(event);
      GestureBinding.instance?.pointerSignalResolver
          .register(event, _handlePointerScroll);
    }
  }

  void _handlePointerScroll(PointerEvent event) {
    assert(event is PointerScrollEvent);
    var scrollEvent = event as PointerScrollEvent;
    double zoomDelta = (-scrollEvent.scrollDelta.dy / 300);
    if (zoom + zoomDelta > _MIN_ZOOM && zoom + zoomDelta < _MAX_ZOOM) {
      setState(() {
        zoom += zoomDelta;
      });
    }
  }

  late BuildContext context;

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
                    clipBehavior: Clip.none,
                    children: _children,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget wrapWithDraggable({required Widget child}) {
    return Draggable<String>(
      maxSimultaneousDrags:  1,
      data: child.key!.toString(),
      child: child,
      onDragStarted: () {
        // currentlyDraggingState.setDragging(true);
      },
      onDragEnd: (details) {
        // if(!details.wasAccepted) {
        //   showDidNotAccept(context);
        // }
        // currentlyDraggingState.setDragging(false);
      },
      childWhenDragging: SizedBox(),
      feedback: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          child: child,
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: 200,
          ),

        ),
      ),
    );
  }

  Widget? wrapWithSelector({Widget? child}) {

    Widget? result = child;

      result = Stack(
        clipBehavior: Clip.none, children: <Widget>[
          child!,
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 3),
                ),
              ),
            ),
          ),
          Positioned(
            child: Text("element!.name"),
            top: -16,
            height: 16,
          ),
        ],
      );


    return GestureDetector(
      child: result,
      onTap:  () {
        print("123");
      },
    );
  }
}
