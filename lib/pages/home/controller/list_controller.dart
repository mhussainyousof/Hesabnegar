import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:me/pages/add_edit_transaction/controller/date_controller.dart';
import '../../../models/money.dart';
import '../../add_edit_transaction/transaction_screen.dart';

class ListController extends GetxController {
  RxList<MoneyModel> moneys = <MoneyModel>[].obs;
  var searchController = TextEditingController().obs;
  bool isEditing = false;
  int index = 0;
  Box<MoneyModel> hiveBox = Hive.box<MoneyModel>('moneyBox');


  @override
void onInit() {
  super.onInit();

  if (isEditing) {
    var task = moneys[index];
    Get.find<DateController>().selectedDate.value = task.date ?? '';
    Get.find<DateController>().pickDate(Get.context!, isEditing: true, initialDate: task.date);
  }
}

  void clearSearch() {
    searchController.value.text = '';
  }

  void selectItemForEditing(BuildContext context, int index) {
    var task = moneys[index];
    Get.find<DateController>().selectedDate.value = task.date ?? '';
    isEditing = true;
    this.index = index;

    Get.to(TransactionScreen());
  }
} 