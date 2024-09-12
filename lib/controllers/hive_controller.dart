import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import '../models/money.dart';
import '../pages/home/controller/list_controller.dart';

class HiveController extends GetxController{
  Box<MoneyModel> hiveBox = Hive.box<MoneyModel>('moneyBox');
  @override
  void onInit() {

    super.onInit(); // Always call super.onInit() first
    getData(); // Call your initialization logic here
  }

  void getData() {
    Get.find<ListController>().moneys.clear();
    hiveBox = Hive.box<MoneyModel>('moneyBox');
    for (var value in hiveBox.values) {
      Get.find<ListController>().moneys.add(value);
    }
  }
  }