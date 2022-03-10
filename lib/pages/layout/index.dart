library layout;

import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news_getx/common/widgets/horizontal_drag.dart';
import 'package:flutter_ducafecat_news_getx/pages/layout/widgets/simple_2D_canvas.dart';
import 'package:get/get.dart';

part './bindings.dart';
part './controller/layout_body_controller.dart';
part './controller/layout_controller.dart';
part './widgets/BodyContentWidget.dart';
part './widgets/BodyLeftWidget.dart';
part './widgets/BodyRightWidget.dart';
part './widgets/BodyWidget.dart';
part './widgets/BottomWidget.dart';
part './widgets/TopWidget.dart';

class LayoutPage extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TopWidget(),
            Expanded(child: BodyWidget()),
            BottomWidget(),
          ],
        ),
      ),
    );
  }
}
