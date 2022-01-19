part of layout;

class BodyRightWidget extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: controller.bodyRightWidth.value,
        decoration: BoxDecoration(
            // color: Colors.grey[500],
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Text("data1"),
            Text("data2"),
            Text("data3"),
            Text("data4"),
          ],
        ),
      ),
    );
  }
}
