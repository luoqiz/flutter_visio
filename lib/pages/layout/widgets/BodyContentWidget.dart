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

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    GlobalKey key1 = GlobalKey();
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[500],
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          Container(
            key: key1,
          ),
          DragTarget<String>(
            key: key,
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return Container(
                margin: EdgeInsets.only(left: 40, top: 40),
                alignment: Alignment(0, 0),
                height: 50,
                width: 300,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  //设置四周边框
                  border: new Border.all(width: 1, color: Colors.red),
                ),
                child: Text("Container 的圆角边框"),
              );
            },
            onAccept: (data) {
              print('Enter floatingActionButton.onPressed()');
              Widget text = Container(
                width: 100,
                height: 100,
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
                  // 边色与边宽度
                  color: Color(0xFF9E9E9E),
                  // 底色
                  //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                  borderRadius: new BorderRadius.vertical(
                      top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
                ),
              );
              Element? e = (key.currentContext as Element);
              e.owner?.lockState(() {
                text.createElement().mount(e, e.slot);
              });
            },
          ),
          Text("data2"),
          Text("data3"),
          Text("data4"),
        ],
      ),
    );
  }
}
