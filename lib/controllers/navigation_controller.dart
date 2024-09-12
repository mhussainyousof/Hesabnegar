import 'package:get/get.dart';
import 'package:me/pages/home/home_screen.dart';
import '../pages/info_screen/info_screen.dart';

class MainController extends GetxController {
  var index = 0.obs;

  void changePage(int newIndex) {
  index.value = newIndex;
  if (newIndex == 0) {
    Get.off(()=>HomeScreen());
  } else {
    Get.off(()=>const InfoScreen());
  }
}

}
