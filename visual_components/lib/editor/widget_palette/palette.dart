import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visual_components/editor/components/visual_components.dart';
import 'package:visual_components/editor/widget_palette/palette_items.dart';

import '../dynamic_widget.dart';

class WidgetPalette extends StatelessWidget {
  const WidgetPalette({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: 200,
          height: double.infinity,
          alignment: Alignment.center,
          color: const Color(0xff313131),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const PaletteCategory(
                title: "Layout",
              ),
              RootDraggable(buildingBlock: test2),
              RootDraggable(buildingBlock: test3),
              RootDraggable(buildingBlock: test4),
              RootDraggable(buildingBlock: test5),
            ],
          )),
    );
  }
}

class RootDraggable extends StatelessWidget {
  const RootDraggable({Key? key, required this.buildingBlock})
      : super(key: key);

  final BuildingBlock buildingBlock;

  @override
  Widget build(BuildContext context) {
    return Draggable<VisualStatefulWidget>(
      childWhenDragging: buildingBlock.representation,
      data: buildingBlock.visualWidget,
      feedback: buildingBlock.representation,
      child: buildingBlock.representation,
      onDragStarted: () {
        if (kDebugMode) {
          print("Started inital drag with id ${buildingBlock.visualWidget.id}");
        }
      },
    );
  }
}
