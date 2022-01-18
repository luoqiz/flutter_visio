part of layout;

class LayoutController extends GetxController {
  LayoutController();

  RxDouble bodyLeftWidth = 200.0.obs;
  double bodyLeftOriginWidth = 0.0;
  RxDouble bodyRightWidth = 200.0.obs;
  double bodyRightOriginWidth = 200.0;
}
