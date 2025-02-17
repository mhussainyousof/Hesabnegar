import 'package:get/get.dart';

class MainController extends GetxController {
  var index = 0.obs;

  void changePage(int newIndex) {
    index.value = newIndex;
    switch (newIndex) {
      case 0:
        Get.offNamed('/homescreen'); // Navigate using named routes
        break;
      case 1:
        Get.offNamed('/infoscreen');
        break;
      default:
        break;
    }
  }
}
