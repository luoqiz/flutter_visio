import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import 'package:visual_components/properties/property.dart';
import 'package:visual_components/server/server.dart';
import 'dynamic_widget.dart';
import 'editor/components/material_components.dart';
import 'editor/components/visual_components.dart';

class VisualEditor extends StatefulWidget {
  const VisualEditor({Key? key}) : super(key: key);

  @override
  _VisualEditorState createState() => _VisualEditorState();
}

class _VisualEditorState extends State<VisualEditor> {
  // TODO clean up form here
  final EditorServer editorServer = EditorServer();

  @override
  void initState() {
    super.initState();
    initServer();
  }

  Future initServer() async {
    final server = Server([editorServer]);
    await server.serve(port: 50051);
    if (kDebugMode) {
      print('Server listening on port ${server.port}...');
    }
  }

  // TODO, the editor should be able to simulate the same widgets in different
  // settings. Because of that we need to have a way to draw the same widget
  // (with the same state and same global keys etc.) multiple times.
  //
  // This is somewhat a difficult problem. Will probably have to create a custom
  // element which lays out the same widget multiple times and draws it multiple
  // times.
  @override
  Widget build(BuildContext context) {
    return Provider<EditorServer>(
      create: (BuildContext context) => editorServer,
      child: Row(
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
      ),
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
            // TODO need
            properties: {
              "onPressed":
                  UnknownProperty(sourceCode: '(){\nprint("Hey!");\n}'),
            },
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
              child: const Text("111"),
            ),
          ),
        ),
      ),
    );
  }
}
