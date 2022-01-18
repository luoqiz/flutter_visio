part of layout;

class BodyLeftWidget extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: controller.bodyLeftWidth.value,
        decoration: BoxDecoration(
            // color: Colors.grey[500],
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Draggable<String>(
                data: "Draggable数据",
                child: Text("我可以被拖动！"),
                feedback: Text("我正在被拖动！"),
              ),
            ),
            Text("data2"),
            Text("data3"),
            Text("data4"),
          ],
        ),
      ),
    );
  }
}
