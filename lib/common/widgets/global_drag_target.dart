import 'package:flutter/material.dart';

typedef MyDragTargetMove<T extends Object> = void Function(
    T data, Offset localPosition);
typedef _OnDragEnd = void Function(
    Velocity velocity, Offset? offset, bool wasAccepted);

class GlobalDragTarget<T extends Object> extends StatefulWidget {
  const GlobalDragTarget(
      {Key? key, this.builder, this.onAccept, this.onMove, this.onWillAccept})
      : super(key: key);

  final DragTargetBuilder<T>? builder;
  final DragTargetAccept<T>? onAccept;
  final MyDragTargetMove<T>? onMove;
  final DragTargetWillAccept<T>? onWillAccept;

  @override
  _GlobalDragTargetState<T> createState() => _GlobalDragTargetState<T>();
}

class _GlobalDragTargetState<T extends Object>
    extends State<GlobalDragTarget<T>> {
  T? data;

  bool didEnter(dynamic data) {
    // no eed for onWillAccept
    if (data is T &&
        (widget.onWillAccept == null || widget.onWillAccept!(data))) {
      setState(() {
        this.data = data;
      });
      return true;
    }
    return false;
  }

  void didMove(dynamic data, Offset localPosition) {
    widget.onMove?.call(data, localPosition);
  }

  void didLeave(dynamic data) {
    if (!mounted) return;
    setState(() {
      this.data = null;
    });
    // No need for onLeave
    /*if (widget.onLeave != null)
      widget.onLeave(avatar.data);*/
  }

  void didDrop(dynamic data) {
    if (!mounted) return;
    setState(() {
      this.data = null;
    });
    if (widget.onAccept != null &&
        (widget.onWillAccept == null || widget.onWillAccept!(data)))
      widget.onAccept!(data);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
      onWillAccept: widget.onWillAccept,
      onAccept: widget.onAccept,
      builder: (BuildContext context, List<T?> candidateData,
          List<dynamic> rejectedData) {
        return MetaData(
          metaData: this,
          behavior: HitTestBehavior.translucent,
          child: widget.builder!(
            context,
            [...candidateData, if (data != null) data],
            rejectedData,
          ),
        );
      },
    );
  }
}
