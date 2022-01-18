import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'components/visual_components.dart';
import 'dynamic_widget.dart';

class VisualEditor extends StatelessWidget {
  const VisualEditor({Key? key}) : super(key: key);

  // TODO, the editor should be able to simulate the same widgets in different
  // settings. Because of that we need to have a way to draw the same widget
  // (with the same state and same global keys etc.) multiple times.
  //
  // This is somewhat a difficult problem. Will probably have to create a custom
  // element which lays out the same widget multiple times and draws it multiple
  // times.
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DragTarget<VisualStatefulWidget>(
          builder: (context, it, it2) {
            return Container(
                width: 200,
                height: double.infinity,
                alignment: Alignment.center,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RootDraggable(buildingBlock: test2),
                    RootDraggable(buildingBlock: test3),
                    RootDraggable(buildingBlock: test4),
                    Expanded(child: RootDraggable(buildingBlock: test5)),
                  ],
                ));
          },
          onWillAccept: (it) => true,
        ),
        Expanded(child: AppWidget()),
      ],
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
        print("Started inital drag with id ${buildingBlock.visualWidget.id}");
      },
    );
  }
}

class AppWidget extends StatelessWidget {
  final GlobalKey<VisualRootState> rootKey = GlobalKey();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VisualRoot(
      key: rootKey,
      child: VisualScaffold(
        id: "YOOOO",
        floatingActionButton: VisualFloatingActionButton(
            id: "BLUB",
            properties: [
              Property(name: "onPressed", value: '(){\nprint("Hey!");\n}'),
            ],
            onPressed: () {
              print("Hey!");
            }),
        body: VisualWrapper(
          id: "SOME ID",
          sourceCode: 'Center(child: RaisedButton(onPressed: ()'
              '{String source = rootKey.currentState.buildSourceCode();'
              'print("Here is the source: \n");print(source);}),),',
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                String? source = rootKey.currentState?.buildSourceCode();
                if (kDebugMode) {
                  print("Here is the source: \n");
                  print(source);
                }
              },
              child: null,
            ),
          ),
        ),
      ),
    );
  }
}
