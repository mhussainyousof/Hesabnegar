
import 'package:get/get.dart';
import 'package:me/controllers/cupertino_controller.dart';
import 'package:me/pages/add_edit_transaction/controller/date_controller.dart';
import 'package:me/controllers/hive_controller.dart';
import 'package:me/controllers/navigation_controller.dart';
import 'package:me/pages/auth/controller/password_controller.dart';
import 'package:me/pages/translate/controller/taranslate.dart';
import '../pages/home/controller/list_controller.dart';
import '../pages/add_edit_transaction/controller/radio_controller.dart';
import '../controllers/textfield_controller.dart';


class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ListController());
    Get.put(TextFieldController());
    Get.put(RadioController());
    Get.put(MainController());
    Get.put(HiveController());
    Get.put(DateController());
    Get.put(TranslateController());
    Get.put(PasswordController());
    // Get.put(NotificationController());
    Get.put(CupertinoController());
  }
}
