part of layout;

class BodyWidget extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // color: Colors.grey[500],
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          BodyLeftWidget(),
          MouseRegion(
            child: HorizontalDrag(
              child: Container(
                height: 100,
                width: 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: VerticalDivider(
                  width: 4,
                  color: Colors.grey,
                ),
              ),
              onChange: (double offset) {
                controller.bodyLeftWidth.value =
                    controller.bodyLeftOriginWidth + offset;
              },
              onDragStart: (DragDownDetails downDetails) {
                controller.bodyLeftOriginWidth = controller.bodyLeftWidth.value;
              },
            ),
            cursor: SystemMouseCursors.resizeLeftRight,
          ),
          Expanded(child: BodyContentWidget()),
          MouseRegion(
            child: HorizontalDrag(
              child: Container(
                height: 100,
                width: 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: VerticalDivider(
                  width: 4,
                  color: Colors.grey,
                ),
              ),
              onChange: (double offset) {
                controller.bodyRightWidth.value =
                    controller.bodyRightOriginWidth - offset;
              },
              onDragStart: (DragDownDetails downDetails) {
                controller.bodyRightOriginWidth =
                    controller.bodyRightWidth.value;
              },
            ),
            cursor: SystemMouseCursors.resizeLeftRight,
          ),
          BodyRightWidget(),
        ],
      ),
    );
  }
}
