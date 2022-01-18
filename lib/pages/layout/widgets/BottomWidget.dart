part of layout;

class BottomWidget extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30.0,
      decoration: BoxDecoration(
          // color: Colors.grey[500],
          border: Border.all(width: 2.0),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Text("data1"),
          Text("data2"),
          Text("data3"),
          Text("data4"),
        ],
      ),
    );
  }
}
