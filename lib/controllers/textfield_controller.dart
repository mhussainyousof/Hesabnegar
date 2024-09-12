import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  TextEditingController? description;
  TextEditingController? pprice;
  @override
  void onInit() {
    description = TextEditingController();
    pprice = TextEditingController();
    super.onInit();
  }
}
