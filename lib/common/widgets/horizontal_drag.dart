import 'package:flutter/material.dart';

class HorizontalDrag extends StatefulWidget {
  final Widget child;

  final Function(DragDownDetails downDetails)? onDragStart;
  final Function(DragEndDetails endDetails)? onDragEnd;
  final Function(DragUpdateDetails updateDetails)? onDragUpdate;
  final Function(double originLeft)? onChange;

  const HorizontalDrag(
      {Key? key,
      required this.child,
      this.onDragStart,
      this.onDragEnd,
      this.onDragUpdate,
      this.onChange})
      : assert(child != null),
        super(key: key);

  @override
  _HorizontalDragState createState() => _HorizontalDragState();
}

class _HorizontalDragState extends State<HorizontalDrag> {
  // 记录组件全局偏移量
  double originLeft = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onPanDown: (DragDownDetails e) {
        originLeft = e.globalPosition.dx;
        if (widget.onDragStart != null) {
          widget.onDragStart!(e);
        }
      },

      //第一种 垂直方向滑动、拖动
      // onVerticalDragUpdate:(DragUpdateDetails e) {
      //用户手指滑动时，更新偏移，重新构建
      //   print("用户onVerticalDragUpdate：${e.globalPosition}");
      //   // setState(() {
      //   //   topDistance += e.delta.dy;
      //   // });
      // },
      // 第二种 水平方向滑动、拖动
      onHorizontalDragUpdate: (DragUpdateDetails e) {
        if (widget.onDragUpdate != null) {
          widget.onDragUpdate!(e);
        }
        if (widget.onChange != null) {
          widget.onChange!(e.globalPosition.dx - originLeft);
        }
      },
      //第三种 全方向滑动、拖动
      // 手指滑动时会触发此回调
      // onPanUpdate: (DragUpdateDetails e) {
      //   print("用户onPanUpdate：${e.globalPosition}");
      //   setState(() {
      //     leftDistance += e.delta.dx;
      //     topDistance += e.delta.dy;
      //   });
      // },

      //滑动结束触发此回调
      onPanEnd: (DragEndDetails e) {
        if (widget.onDragEnd != null) {
          widget.onDragEnd!(e);
        }
      },
    );
  }
}
