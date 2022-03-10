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
              width: 100,
              height: 100,
              color: Colors.green,
              alignment: Alignment.center,
              child: Draggable<String>(
                data: "Container",
                child: Text("Container 部件"),
                feedback: Text("Container 部件"),
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
