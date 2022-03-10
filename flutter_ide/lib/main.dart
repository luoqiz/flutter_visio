import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ide/simple_2D_canvas.dart';

class CanvasWidget {
  final Offset position;
  final Widget child;
  final Size size;

  CanvasWidget(
      {required this.position, required this.size, required this.child});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FocusNode focusNode = FocusNode();
  MyApp({Key? key}) : super(key: key);
  final Map<String, CanvasWidget> _map = {
    "1": CanvasWidget(
      child: Focus(
        focusNode: FocusNode() ,
        child: Container(
          color: Colors.green,
          child: Text("123"),
        ),
      ),
      position: Offset(90, 90),
      size: Size(120, 120),
    ),
    "2": CanvasWidget(
      child: Scaffold(
        appBar: AppBar(
          leading: Placeholder(),
        ),
        body: Container(
          color: Colors.green,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("11111111111111");
            },
          ),
        ),
      ),
      position: Offset(190, 30),
      size: Size(365, 720),
    ),
    "3": CanvasWidget(
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onPanStart: (_) {},
                // onPanUpdate: (update) {
                //   element.position.updateValue(element.position.value + update.delta, context, element.id);
                // },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Icon(Icons.open_with),
                ),
              ),
            ),
          ),
        ],
      ),
      position: Offset(600, 40), size: Size(200,400),
    )
  };

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
      home: Stack(
        children: [
          Builder(builder: (BuildContext context) {
            return Simple2DCanvas(
              widgets: _map,
            );
          })
        ],
      ),
    );
  }
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
            it.child, widget.widgets.keys.toList().indexOf(key)),
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
              child: Builder(builder: (context) {
                this.context = context;
                return Stack(
                  // overflow: Overflow.visible,
                  children: _children,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

// class Stack2 extends MultiChildRenderObjectWidget {
//   /// Creates a stack layout widget.
//   ///
//   /// By default, the non-positioned children of the stack are aligned by their
//   /// top left corners.
//   Stack2({
//     Key? key,
//     this.alignment = AlignmentDirectional.topStart,
//     this.textDirection,
//     this.fit = StackFit.loose,
//     this.overflow = Overflow.clip,
//     List<Widget> children = const <Widget>[],
//   }) : super(key: key, children: children);
//
//   /// How to align the non-positioned and partially-positioned children in the
//   /// stack.
//   ///
//   /// The non-positioned children are placed relative to each other such that
//   /// the points determined by [alignment] are co-located. For example, if the
//   /// [alignment] is [Alignment.topLeft], then the top left corner of
//   /// each non-positioned child will be located at the same global coordinate.
//   ///
//   /// Partially-positioned children, those that do not specify an alignment in a
//   /// particular axis (e.g. that have neither `top` nor `bottom` set), use the
//   /// alignment to determine how they should be positioned in that
//   /// under-specified axis.
//   ///
//   /// Defaults to [AlignmentDirectional.topStart].
//   ///
//   /// See also:
//   ///
//   ///  * [Alignment], a class with convenient constants typically used to
//   ///    specify an [AlignmentGeometry].
//   ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
//   ///    relative to text direction.
//   final AlignmentGeometry alignment;
//
//   /// The text direction with which to resolve [alignment].
//   ///
//   /// Defaults to the ambient [Directionality].
//   final TextDirection? textDirection;
//
//   /// How to size the non-positioned children in the stack.
//   ///
//   /// The constraints passed into the [Stack] from its parent are either
//   /// loosened ([StackFit.loose]) or tightened to their biggest size
//   /// ([StackFit.expand]).
//   final StackFit fit;
//
//   /// Whether overflowing children should be clipped. See [Overflow].
//   ///
//   /// Some children in a stack might overflow its box. When this flag is set to
//   /// [Overflow.clip], children cannot paint outside of the stack's box.
//   final Overflow overflow;
//
//   @override
//   RenderStack2 createRenderObject(BuildContext context) {
//     return RenderStack2(
//       alignment: alignment,
//       textDirection: textDirection ?? Directionality.of(context),
//       fit: fit,
//       overflow: overflow,
//     );
//   }
//
//   @override
//   void updateRenderObject(BuildContext context, RenderStack2 renderObject) {
//     renderObject
//       ..alignment = alignment
//       ..textDirection = textDirection ?? Directionality.of(context)
//       ..fit = fit
//       ..overflow = overflow;
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//         .add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment));
//     properties.add(EnumProperty<TextDirection>('textDirection', textDirection,
//         defaultValue: null));
//     properties.add(EnumProperty<StackFit>('fit', fit));
//     properties.add(EnumProperty<Overflow>('overflow', overflow));
//   }
// }

// class RenderStack2 extends RenderBox
//     with
//         ContainerRenderObjectMixin<RenderBox, StackParentData>,
//         RenderBoxContainerDefaultsMixin<RenderBox, StackParentData> {
//   /// Creates a stack render object.
//   ///
//   /// By default, the non-positioned children of the stack are aligned by their
//   /// top left corners.
//   RenderStack2({
//     List<RenderBox> children,
//     AlignmentGeometry alignment = AlignmentDirectional.topStart,
//     TextDirection textDirection,
//     StackFit fit = StackFit.loose,
//     Overflow overflow = Overflow.clip,
//   })  : assert(alignment != null),
//         assert(fit != null),
//         assert(overflow != null),
//         _alignment = alignment,
//         _textDirection = textDirection,
//         _fit = fit,
//         _overflow = overflow {
//     addAll(children);
//   }
//
//   bool _hasVisualOverflow = false;
//
//   @override
//   bool hitTest(BoxHitTestResult result, {Offset position}) {
//     if (hitTestChildren(result, position: position) || hitTestSelf(position)) {
//       result.add(BoxHitTestEntry(this, position));
//       return true;
//     }
//     return false;
//   }
//
//   @override
//   void setupParentData(RenderBox child) {
//     if (child.parentData is! StackParentData)
//       child.parentData = StackParentData();
//   }
//
//   Alignment _resolvedAlignment;
//
//   void _resolve() {
//     if (_resolvedAlignment != null) return;
//     _resolvedAlignment = alignment.resolve(textDirection);
//   }
//
//   void _markNeedResolution() {
//     _resolvedAlignment = null;
//     markNeedsLayout();
//   }
//
//   /// How to align the non-positioned or partially-positioned children in the
//   /// stack.
//   ///
//   /// The non-positioned children are placed relative to each other such that
//   /// the points determined by [alignment] are co-located. For example, if the
//   /// [alignment] is [Alignment.topLeft], then the top left corner of
//   /// each non-positioned child will be located at the same global coordinate.
//   ///
//   /// Partially-positioned children, those that do not specify an alignment in a
//   /// particular axis (e.g. that have neither `top` nor `bottom` set), use the
//   /// alignment to determine how they should be positioned in that
//   /// under-specified axis.
//   ///
//   /// If this is set to an [AlignmentDirectional] object, then [textDirection]
//   /// must not be null.
//   AlignmentGeometry get alignment => _alignment;
//   AlignmentGeometry _alignment;
//
//   set alignment(AlignmentGeometry value) {
//     assert(value != null);
//     if (_alignment == value) return;
//     _alignment = value;
//     _markNeedResolution();
//   }
//
//   /// The text direction with which to resolve [alignment].
//   ///
//   /// This may be changed to null, but only after the [alignment] has been changed
//   /// to a value that does not depend on the direction.
//   TextDirection get textDirection => _textDirection;
//   TextDirection _textDirection;
//
//   set textDirection(TextDirection value) {
//     if (_textDirection == value) return;
//     _textDirection = value;
//     _markNeedResolution();
//   }
//
//   /// How to size the non-positioned children in the stack.
//   ///
//   /// The constraints passed into the [RenderStack] from its parent are either
//   /// loosened ([StackFit.loose]) or tightened to their biggest size
//   /// ([StackFit.expand]).
//   StackFit get fit => _fit;
//   StackFit _fit;
//
//   set fit(StackFit value) {
//     assert(value != null);
//     if (_fit != value) {
//       _fit = value;
//       markNeedsLayout();
//     }
//   }
//
//   /// Whether overflowing children should be clipped. See [Overflow].
//   ///
//   /// Some children in a stack might overflow its box. When this flag is set to
//   /// [Overflow.clip], children cannot paint outside of the stack's box.
//   Overflow get overflow => _overflow;
//   Overflow _overflow;
//
//   set overflow(Overflow value) {
//     assert(value != null);
//     if (_overflow != value) {
//       _overflow = value;
//       markNeedsPaint();
//     }
//   }
//
//   double _getIntrinsicDimension(double mainChildSizeGetter(RenderBox child)) {
//     double extent = 0.0;
//     RenderBox child = firstChild;
//     while (child != null) {
//       final StackParentData childParentData = child.parentData;
//       if (!childParentData.isPositioned)
//         extent = math.max(extent, mainChildSizeGetter(child));
//       assert(child.parentData == childParentData);
//       child = childParentData.nextSibling;
//     }
//     return extent;
//   }
//
//   @override
//   double computeMinIntrinsicWidth(double height) {
//     return _getIntrinsicDimension(
//         (RenderBox child) => child.getMinIntrinsicWidth(height));
//   }
//
//   @override
//   double computeMaxIntrinsicWidth(double height) {
//     return _getIntrinsicDimension(
//         (RenderBox child) => child.getMaxIntrinsicWidth(height));
//   }
//
//   @override
//   double computeMinIntrinsicHeight(double width) {
//     return _getIntrinsicDimension(
//         (RenderBox child) => child.getMinIntrinsicHeight(width));
//   }
//
//   @override
//   double computeMaxIntrinsicHeight(double width) {
//     return _getIntrinsicDimension(
//         (RenderBox child) => child.getMaxIntrinsicHeight(width));
//   }
//
//   @override
//   double computeDistanceToActualBaseline(TextBaseline baseline) {
//     return defaultComputeDistanceToHighestActualBaseline(baseline);
//   }
//
//   @override
//   void performLayout() {
//     _resolve();
//     assert(_resolvedAlignment != null);
//     _hasVisualOverflow = false;
//     bool hasNonPositionedChildren = false;
//     if (childCount == 0) {
//       size = constraints.biggest;
//       assert(size.isFinite);
//       return;
//     }
//
//     double width = constraints.minWidth;
//     double height = constraints.minHeight;
//
//     BoxConstraints nonPositionedConstraints;
//     assert(fit != null);
//     switch (fit) {
//       case StackFit.loose:
//         nonPositionedConstraints = constraints.loosen();
//         break;
//       case StackFit.expand:
//         nonPositionedConstraints = BoxConstraints.tight(constraints.biggest);
//         break;
//       case StackFit.passthrough:
//         nonPositionedConstraints = constraints;
//         break;
//     }
//     assert(nonPositionedConstraints != null);
//
//     RenderBox child = firstChild;
//     while (child != null) {
//       final StackParentData childParentData = child.parentData;
//
//       if (!childParentData.isPositioned) {
//         hasNonPositionedChildren = true;
//
//         child.layout(nonPositionedConstraints, parentUsesSize: true);
//
//         final Size childSize = child.size;
//         width = math.max(width, childSize.width);
//         height = math.max(height, childSize.height);
//       }
//
//       child = childParentData.nextSibling;
//     }
//
//     if (hasNonPositionedChildren) {
//       size = Size(width, height);
//       assert(size.width == constraints.constrainWidth(width));
//       assert(size.height == constraints.constrainHeight(height));
//     } else {
//       size = constraints.biggest;
//     }
//
//     assert(size.isFinite);
//
//     child = firstChild;
//     while (child != null) {
//       final StackParentData childParentData = child.parentData;
//
//       if (!childParentData.isPositioned) {
//         childParentData.offset =
//             _resolvedAlignment.alongOffset(size - child.size);
//       } else {
//         BoxConstraints childConstraints = const BoxConstraints();
//
//         if (childParentData.left != null && childParentData.right != null)
//           childConstraints = childConstraints.tighten(
//               width: size.width - childParentData.right - childParentData.left);
//         else if (childParentData.width != null)
//           childConstraints =
//               childConstraints.tighten(width: childParentData.width);
//
//         if (childParentData.top != null && childParentData.bottom != null)
//           childConstraints = childConstraints.tighten(
//               height:
//                   size.height - childParentData.bottom - childParentData.top);
//         else if (childParentData.height != null)
//           childConstraints =
//               childConstraints.tighten(height: childParentData.height);
//
//         child.layout(childConstraints, parentUsesSize: true);
//
//         double x;
//         if (childParentData.left != null) {
//           x = childParentData.left;
//         } else if (childParentData.right != null) {
//           x = size.width - childParentData.right - child.size.width;
//         } else {
//           x = _resolvedAlignment.alongOffset(size - child.size).dx;
//         }
//
//         if (x < 0.0 || x + child.size.width > size.width)
//           _hasVisualOverflow = true;
//
//         double y;
//         if (childParentData.top != null) {
//           y = childParentData.top;
//         } else if (childParentData.bottom != null) {
//           y = size.height - childParentData.bottom - child.size.height;
//         } else {
//           y = _resolvedAlignment.alongOffset(size - child.size).dy;
//         }
//
//         if (y < 0.0 || y + child.size.height > size.height)
//           _hasVisualOverflow = true;
//
//         childParentData.offset = Offset(x, y);
//       }
//
//       assert(child.parentData == childParentData);
//       child = childParentData.nextSibling;
//     }
//   }
//
//   @override
//   bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
//     return defaultHitTestChildren(result, position: position);
//   }
//
//   /// Override in subclasses to customize how the stack paints.
//   ///
//   /// By default, the stack uses [defaultPaint]. This function is called by
//   /// [paint] after potentially applying a clip to contain visual overflow.
//   @protected
//   void paintStack(PaintingContext context, Offset offset) {
//     defaultPaint(context, offset);
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     if (_overflow == Overflow.clip && _hasVisualOverflow) {
//       context.pushClipRect(
//           needsCompositing, offset, Offset.zero & size, paintStack);
//     } else {
//       paintStack(context, offset);
//     }
//   }
//
//   @override
//   Rect describeApproximatePaintClip(RenderObject child) =>
//       _hasVisualOverflow ? Offset.zero & size : null;
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//         .add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment));
//     properties.add(EnumProperty<TextDirection>('textDirection', textDirection));
//     properties.add(EnumProperty<StackFit>('fit', fit));
//     properties.add(EnumProperty<Overflow>('overflow', overflow));
//   }
// }

// class Positioned2 extends ParentDataWidget<StackParentData> {
//   /// Creates a widget that controls where a child of a [Stack] is positioned.
//   ///
//   /// Only two out of the three horizontal values ([left], [right],
//   /// [width]), and only two out of the three vertical values ([top],
//   /// [bottom], [height]), can be set. In each case, at least one of
//   /// the three must be null.
//   ///
//   /// See also:
//   ///
//   ///  * [Positioned.directional], which specifies the widget's horizontal
//   ///    position using `start` and `end` rather than `left` and `right`.
//   ///  * [PositionedDirectional], which is similar to [Positioned.directional]
//   ///    but adapts to the ambient [Directionality].
//   const Positioned2({
//     Key? key,
//     this.left,
//     this.top,
//     this.right,
//     this.bottom,
//     this.width,
//     this.height,
//     required Widget child,
//   })  : assert(left == null || right == null || width == null),
//         assert(top == null || bottom == null || height == null),
//         super(key: key, child: child);
//
//   /// Creates a Positioned object with the values from the given [Rect].
//   ///
//   /// This sets the [left], [top], [width], and [height] properties
//   /// from the given [Rect]. The [right] and [bottom] properties are
//   /// set to null.
//   Positioned2.fromRect({
//     Key? key,
//     required Rect rect,
//     required Widget child,
//   })  : left = rect.left,
//         top = rect.top,
//         width = rect.width,
//         height = rect.height,
//         right = null,
//         bottom = null,
//         super(key: key, child: child);
//
//   /// Creates a Positioned object with the values from the given [RelativeRect].
//   ///
//   /// This sets the [left], [top], [right], and [bottom] properties from the
//   /// given [RelativeRect]. The [height] and [width] properties are set to null.
//   Positioned2.fromRelativeRect({
//     Key? key,
//     required RelativeRect rect,
//     required Widget child,
//   })  : left = rect.left,
//         top = rect.top,
//         right = rect.right,
//         bottom = rect.bottom,
//         width = null,
//         height = null,
//         super(key: key, child: child);
//
//   /// Creates a Positioned object with [left], [top], [right], and [bottom] set
//   /// to 0.0 unless a value for them is passed.
//   const Positioned2.fill({
//     Key? key,
//     this.left = 0.0,
//     this.top = 0.0,
//     this.right = 0.0,
//     this.bottom = 0.0,
//     required Widget child,
//   })  : width = null,
//         height = null,
//         super(key: key, child: child);
//
//   /// Creates a widget that controls where a child of a [Stack] is positioned.
//   ///
//   /// Only two out of the three horizontal values (`start`, `end`,
//   /// [width]), and only two out of the three vertical values ([top],
//   /// [bottom], [height]), can be set. In each case, at least one of
//   /// the three must be null.
//   ///
//   /// If `textDirection` is [TextDirection.rtl], then the `start` argument is
//   /// used for the [right] property and the `end` argument is used for the
//   /// [left] property. Otherwise, if `textDirection` is [TextDirection.ltr],
//   /// then the `start` argument is used for the [left] property and the `end`
//   /// argument is used for the [right] property.
//   ///
//   /// The `textDirection` argument must not be null.
//   ///
//   /// See also:
//   ///
//   ///  * [PositionedDirectional], which adapts to the ambient [Directionality].
//   factory Positioned2.directional({
//     Key? key,
//     required TextDirection textDirection,
//     double? start,
//     double? top,
//     double? end,
//     double? bottom,
//     double? width,
//     double? height,
//     required Widget child,
//   }) {
//     double? left;
//     double? right;
//     switch (textDirection) {
//       case TextDirection.rtl:
//         left = end;
//         right = start;
//         break;
//       case TextDirection.ltr:
//         left = start;
//         right = end;
//         break;
//     }
//     return Positioned2(
//       key: key,
//       left: left,
//       top: top,
//       right: right,
//       bottom: bottom,
//       width: width,
//       height: height,
//       child: child,
//     );
//   }
//
//   /// The distance that the child's left edge is inset from the left of the stack.
//   ///
//   /// Only two out of the three horizontal values ([left], [right], [width]) can be
//   /// set. The third must be null.
//   ///
//   /// If all three are null, the [Stack.alignment] is used to position the child
//   /// horizontally.
//   final double? left;
//
//   /// The distance that the child's top edge is inset from the top of the stack.
//   ///
//   /// Only two out of the three vertical values ([top], [bottom], [height]) can be
//   /// set. The third must be null.
//   ///
//   /// If all three are null, the [Stack.alignment] is used to position the child
//   /// vertically.
//   final double? top;
//
//   /// The distance that the child's right edge is inset from the right of the stack.
//   ///
//   /// Only two out of the three horizontal values ([left], [right], [width]) can be
//   /// set. The third must be null.
//   ///
//   /// If all three are null, the [Stack.alignment] is used to position the child
//   /// horizontally.
//   final double? right;
//
//   /// The distance that the child's bottom edge is inset from the bottom of the stack.
//   ///
//   /// Only two out of the three vertical values ([top], [bottom], [height]) can be
//   /// set. The third must be null.
//   ///
//   /// If all three are null, the [Stack.alignment] is used to position the child
//   /// vertically.
//   final double? bottom;
//
//   /// The child's width.
//   ///
//   /// Only two out of the three horizontal values ([left], [right], [width]) can be
//   /// set. The third must be null.
//   ///
//   /// If all three are null, the [Stack.alignment] is used to position the child
//   /// horizontally.
//   final double? width;
//
//   /// The child's height.
//   ///
//   /// Only two out of the three vertical values ([top], [bottom], [height]) can be
//   /// set. The third must be null.
//   ///
//   /// If all three are null, the [Stack.alignment] is used to position the child
//   /// vertically.
//   final double? height;
//
//   @override
//   void applyParentData(RenderObject renderObject) {
//     assert(renderObject.parentData is StackParentData);
//     final StackParentData parentData =
//         renderObject.parentData as StackParentData;
//     bool needsLayout = false;
//
//     if (parentData.left != left) {
//       parentData.left = left;
//       needsLayout = true;
//     }
//
//     if (parentData.top != top) {
//       parentData.top = top;
//       needsLayout = true;
//     }
//
//     if (parentData.right != right) {
//       parentData.right = right;
//       needsLayout = true;
//     }
//
//     if (parentData.bottom != bottom) {
//       parentData.bottom = bottom;
//       needsLayout = true;
//     }
//
//     if (parentData.width != width) {
//       parentData.width = width;
//       needsLayout = true;
//     }
//
//     if (parentData.height != height) {
//       parentData.height = height;
//       needsLayout = true;
//     }
//
//     if (needsLayout) {
//       final AbstractNode? targetParent = renderObject.parent;
//       if (targetParent is RenderObject) targetParent.markNeedsLayout();
//     }
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DoubleProperty('left', left, defaultValue: null));
//     properties.add(DoubleProperty('top', top, defaultValue: null));
//     properties.add(DoubleProperty('right', right, defaultValue: null));
//     properties.add(DoubleProperty('bottom', bottom, defaultValue: null));
//     properties.add(DoubleProperty('width', width, defaultValue: null));
//     properties.add(DoubleProperty('height', height, defaultValue: null));
//   }
//
//   @override
//   Type get debugTypicalAncestorWidgetClass => Stack2;
// }

// class MyHomePage extends StatelessWidget {
//   Map<String, CanvasWidget> map = {
//     "1": CanvasWidget(
//       position: const Offset(30, 30),
//       size: const Size(100, 100),
//       child: Container(
//         color: Colors.amberAccent,
//         child: Text("homepage"),
//       ),
//     )
//   };
//
//   double _left = 0;
//   double _top = 0;
//   double _widthAndHeight = 200;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       // theme: themeData,
//       home: Builder(builder: (context) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(
//             textScaleFactor: 0.8,
//             devicePixelRatio: 11,
//           ),
//           child: Scaffold(
//             body: Center(
//               child: Stack(
//                 children: [
//                   /// 缩放手势
//                   GestureDetector(
//                     onScaleEnd: (details) {
//                       print(
//                           "onScaleEnd---${details.velocity}---${details.pointerCount}");
//                     },
//                     onScaleStart: (details) {
//                       print(
//                           "onScaleStart---${details.focalPoint}---${details.pointerCount}");
//                     },
//                     onScaleUpdate: (details) {
//                       print(
//                           "onScaleUpdate---${details.scale}---${details.scale.clamp(0.1, 1.2)}");
//                     },
//                     child: Container(
//                       width: _widthAndHeight,
//                       height: _widthAndHeight,
//                       color: Colors.orange,
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Jimi",
//                         style: TextStyle(color: Colors.white, fontSize: 30),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
// // Widget _test1(){
// //   return  Row(
// //     children: [
// //       Container(
// //         width: 300,
// //         height: double.infinity,
// //         color: Colors.black12,
// //         child: const Text("data"),
// //       ),
// //       Expanded(
// //         child: Stack(
// //           children: [
// //             Listener(
// //               child: Transform(
// //                 transform: Matrix4.identity()
// //                   ..translate(_offset.dx, _offset.dy)
// //                   ..scale(_scale, _scale),
// //                 child: Center(
// //                   child: Container(
// //                     color: Colors.green,
// //                     height: 200,
// //                     width: 200,
// //                     child: MyRenderBox(
// //                       child: const FlutterLogo(
// //                         size: 88,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 alignment: Alignment.center,
// //               ),
// //             ),
// //             // 使用 Transform 包裹 child ，以便进行平移和缩放处理
// //
// //
// //           ],
// //         ),
// //       )
// //     ],
// //   );
// // }
// }

// class MyRenderBox extends SingleChildRenderObjectWidget {
//   const MyRenderBox({Key? key, required Widget child}) : super(child: child);
//
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderMyRenderBox();
//   }
// }

// class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin {
//   @override
//   void performLayout() {
//     print(
//         "constraintsconstraintsconstraintsconstraintsconstraintsconstraintsconstraintsconstraintsco"
//         "nstraintsconstraintsconstraintsconstraintsconstraintsconstraints");
//     print(constraints);
//     child!.layout(constraints);
//     size = Size(200, 200);
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     context.paintChild(child!, offset);
//   }
// }
