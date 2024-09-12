import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CupertinoController extends GetxController{
  var ison = false.obs;
  void toggle(){
    ison.value = !ison.value;           
  Hive.box('settings').put('isON', ison.value);
  }


  @override
  void onInit(){
    super.onInit();
    ison.value = Hive.box('settings').get('isON', defaultValue: false);
  }

}