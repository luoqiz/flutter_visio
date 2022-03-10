part of layout;

class BodyContentWidget extends GetView<LayoutController> {
  static Element? findChild(Element e, Widget w) {
    Element? child;
    void visit(Element element) {
      if (w == element.widget)
        child = element;
      else
        element.visitChildren(visit);
    }

    visit(e);
    return child;
  }

  Widget text = Text("555");

  final Map<String, CanvasWidget> _map = {
    "1": CanvasWidget(
      child: Focus(
        key: GlobalKey(),
        focusNode: FocusNode(),
        child: Container(
          // color: Colors.green,
          child: Text("123"),
        ),
      ),
      position: Offset(90, 90),
      size: Size(120, 120),
    ),
    "2": CanvasWidget(
      child: Scaffold(
        key: GlobalKey(),
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
        key: GlobalKey(),
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
      position: Offset(600, 40),
      size: Size(200, 400),
    ),
    "4": CanvasWidget(
      child: Scaffold(
        key: GlobalKey(),
        body: SizedBox(
          key: GlobalKey(),
          width: 100,
          height: 200,
          child: GestureDetector(
            child:  Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Text("data----//////////////--"),
                Positioned.fill(
                  child: IgnorePointer(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 30),
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
            ),
            onTap: () {
              print("123");
            },
          ),
        ),
      ),
      position: Offset(900, 40),
      size: Size(400, 400),
    ),
  };

  Widget wrapWithSelector(Widget child) {
    Widget result = child;

    result = Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        child,
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
      onTap: () {
        print("123");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Simple2DCanvas(
      widgets: _map,
    );
  }
}
