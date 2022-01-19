part of layout;

class LayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(() => LayoutController());
    Get.lazyPut<LayoutBodyController>(() => LayoutBodyController());
  }
}
