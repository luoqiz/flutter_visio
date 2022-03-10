import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class CanvasWidget {

  final Offset position;
  final Widget child;
  final Size size;

  CanvasWidget({required this.position, required this.size, required this.child});
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
      return Positioned2(
        top: it.position.dy - position.dy,
        left: it.position.dx - position.dx,
        width: it.size.width,
        height: it.size.height,
        child: RepaintBoundary.wrap(it.child, widget.widgets.keys.toList().indexOf(key)),
      );
    }).toList()/*..insert(0, Positioned2.fill( TODO implement at some point
        child: BackgroundGrid(
          zoom: zoom,
          offset: position,
        )
    ))*/;
  }



  void onPanUpdate(DragUpdateDetails details) {
    setState(() {
      // Correct for zooming
      Offset movement = details.delta / zoom;
      position -= movement;
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

 late var context;

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
                    return Stack2(
                      overflow: Overflow.visible,
                      children: _children,
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

class Positioned2 extends ParentDataWidget<StackParentData> {
  /// Creates a widget that controls where a child of a [Stack] is positioned.
  ///
  /// Only two out of the three horizontal values ([left], [right],
  /// [width]), and only two out of the three vertical values ([top],
  /// [bottom], [height]), can be set. In each case, at least one of
  /// the three must be null.
  ///
  /// See also:
  ///
  ///  * [Positioned.directional], which specifies the widget's horizontal
  ///    position using `start` and `end` rather than `left` and `right`.
  ///  * [PositionedDirectional], which is similar to [Positioned.directional]
  ///    but adapts to the ambient [Directionality].
  const Positioned2({
    Key? key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    required Widget child,
  }) : assert(left == null || right == null || width == null),
        assert(top == null || bottom == null || height == null),
        super(key: key, child: child);

  /// Creates a Positioned object with the values from the given [Rect].
  ///
  /// This sets the [left], [top], [width], and [height] properties
  /// from the given [Rect]. The [right] and [bottom] properties are
  /// set to null.
  Positioned2.fromRect({
    Key? key,
    required Rect rect,
    required Widget child,
  }) : left = rect.left,
        top = rect.top,
        width = rect.width,
        height = rect.height,
        right = null,
        bottom = null,
        super(key: key, child: child);

  /// Creates a Positioned object with the values from the given [RelativeRect].
  ///
  /// This sets the [left], [top], [right], and [bottom] properties from the
  /// given [RelativeRect]. The [height] and [width] properties are set to null.
  Positioned2.fromRelativeRect({
    Key? key,
    required RelativeRect rect,
    required Widget child,
  }) : left = rect.left,
        top = rect.top,
        right = rect.right,
        bottom = rect.bottom,
        width = null,
        height = null,
        super(key: key, child: child);

  /// Creates a Positioned object with [left], [top], [right], and [bottom] set
  /// to 0.0 unless a value for them is passed.
  const Positioned2.fill({
    Key? key,
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
    required Widget child,
  }) : width = null,
        height = null,
        super(key: key, child: child);

  /// Creates a widget that controls where a child of a [Stack] is positioned.
  ///
  /// Only two out of the three horizontal values (`start`, `end`,
  /// [width]), and only two out of the three vertical values ([top],
  /// [bottom], [height]), can be set. In each case, at least one of
  /// the three must be null.
  ///
  /// If `textDirection` is [TextDirection.rtl], then the `start` argument is
  /// used for the [right] property and the `end` argument is used for the
  /// [left] property. Otherwise, if `textDirection` is [TextDirection.ltr],
  /// then the `start` argument is used for the [left] property and the `end`
  /// argument is used for the [right] property.
  ///
  /// The `textDirection` argument must not be null.
  ///
  /// See also:
  ///
  ///  * [PositionedDirectional], which adapts to the ambient [Directionality].
  factory Positioned2.directional({
    Key? key,
    required TextDirection textDirection,
    double? start,
    double? top,
    double? end,
    double? bottom,
    double? width,
    double? height,
    required Widget child,
  }) {
    double left;
    double right;
    switch (textDirection) {
      case TextDirection.rtl:
        left = end!;
        right = start!;
        break;
      case TextDirection.ltr:
        left = start!;
        right = end!;
        break;
    }
    return Positioned2(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: child,
    );
  }

  /// The distance that the child's left edge is inset from the left of the stack.
  ///
  /// Only two out of the three horizontal values ([left], [right], [width]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// horizontally.
  final double? left;

  /// The distance that the child's top edge is inset from the top of the stack.
  ///
  /// Only two out of the three vertical values ([top], [bottom], [height]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// vertically.
  final double? top;

  /// The distance that the child's right edge is inset from the right of the stack.
  ///
  /// Only two out of the three horizontal values ([left], [right], [width]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// horizontally.
  final double? right;

  /// The distance that the child's bottom edge is inset from the bottom of the stack.
  ///
  /// Only two out of the three vertical values ([top], [bottom], [height]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// vertically.
  final double? bottom;

  /// The child's width.
  ///
  /// Only two out of the three horizontal values ([left], [right], [width]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// horizontally.
  final double? width;

  /// The child's height.
  ///
  /// Only two out of the three vertical values ([top], [bottom], [height]) can be
  /// set. The third must be null.
  ///
  /// If all three are null, the [Stack.alignment] is used to position the child
  /// vertically.
  final double? height;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is StackParentData);
    final StackParentData parentData = renderObject.parentData as StackParentData;
    bool needsLayout = false;

    if (parentData.left != left) {
      parentData.left = left;
      needsLayout = true;
    }

    if (parentData.top != top) {
      parentData.top = top;
      needsLayout = true;
    }

    if (parentData.right != right) {
      parentData.right = right;
      needsLayout = true;
    }

    if (parentData.bottom != bottom) {
      parentData.bottom = bottom;
      needsLayout = true;
    }

    if (parentData.width != width) {
      parentData.width = width;
      needsLayout = true;
    }

    if (parentData.height != height) {
      parentData.height = height;
      needsLayout = true;
    }

    if (needsLayout) {
      final AbstractNode targetParent = renderObject.parent as AbstractNode;
      if (targetParent is RenderObject)
        targetParent.markNeedsLayout();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('left', left, defaultValue: null));
    properties.add(DoubleProperty('top', top, defaultValue: null));
    properties.add(DoubleProperty('right', right, defaultValue: null));
    properties.add(DoubleProperty('bottom', bottom, defaultValue: null));
    properties.add(DoubleProperty('width', width, defaultValue: null));
    properties.add(DoubleProperty('height', height, defaultValue: null));
  }

  @override
  Type get debugTypicalAncestorWidgetClass => Stack2;
}

class Stack2 extends MultiChildRenderObjectWidget {
  /// Creates a stack layout widget.
  ///
  /// By default, the non-positioned children of the stack are aligned by their
  /// top left corners.
  Stack2({
    Key? key,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.fit = StackFit.loose,
    this.overflow = Overflow.clip,
    List<Widget> children = const <Widget>[],
  }) : super(key: key, children: children);

  /// How to align the non-positioned and partially-positioned children in the
  /// stack.
  ///
  /// The non-positioned children are placed relative to each other such that
  /// the points determined by [alignment] are co-located. For example, if the
  /// [alignment] is [Alignment.topLeft], then the top left corner of
  /// each non-positioned child will be located at the same global coordinate.
  ///
  /// Partially-positioned children, those that do not specify an alignment in a
  /// particular axis (e.g. that have neither `top` nor `bottom` set), use the
  /// alignment to determine how they should be positioned in that
  /// under-specified axis.
  ///
  /// Defaults to [AlignmentDirectional.topStart].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry alignment;

  /// The text direction with which to resolve [alignment].
  ///
  /// Defaults to the ambient [Directionality].
  final TextDirection? textDirection;

  /// How to size the non-positioned children in the stack.
  ///
  /// The constraints passed into the [Stack] from its parent are either
  /// loosened ([StackFit.loose]) or tightened to their biggest size
  /// ([StackFit.expand]).
  final StackFit fit;

  /// Whether overflowing children should be clipped. See [Overflow].
  ///
  /// Some children in a stack might overflow its box. When this flag is set to
  /// [Overflow.clip], children cannot paint outside of the stack's box.
  final Overflow overflow;
  //
  // @override
  // RenderStack2 createRenderObject(BuildContext context) {
  //   return RenderStack2(
  //     alignment: alignment,
  //     textDirection: textDirection ?? Directionality.of(context),
  //     fit: fit,
  //     overflow: overflow,
  //   );
  // }
  //
  // @override
  // void updateRenderObject(BuildContext context, RenderStack2 renderObject) {
  //   renderObject
  //     ..alignment = alignment
  //     ..textDirection = textDirection ?? Directionality.of(context)
  //     ..fit = fit
  //     ..overflow = overflow;
  // }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment));
    properties.add(EnumProperty<TextDirection>('textDirection', textDirection, defaultValue: null));
    properties.add(EnumProperty<StackFit>('fit', fit));
    properties.add(EnumProperty<Overflow>('overflow', overflow));
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }
}

