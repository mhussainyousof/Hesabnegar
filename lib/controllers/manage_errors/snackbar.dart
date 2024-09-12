
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/constant.dart';

import '../../pages/translate/controller/taranslate.dart';

class MySnackBar {
  static void showCustomSnackBar({
    required String title,
    required String message,
    required Color Iconcolor,
    Duration? duration,
    required Color TextColor1,
    required Color TextColor2,
  }) {
    var isEnglish = Get.find<TranslateController>().currentLanguage == 'en';
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        textAlign: isEnglish ? TextAlign.left : TextAlign.right,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: TextColor1,
        ),
        textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
      ),
      messageText: Text(
        message,
        textAlign: isEnglish ? TextAlign.left : TextAlign.right,
        style: TextStyle(fontSize: 14, color: TextColor2),
        textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
      ),
      icon: Icon(
            Icons.error_outline,
            color: Iconcolor,
          ),
          
      duration: duration ?? const Duration(seconds: 2),
      animationDuration: const Duration(seconds: 1),
      backgroundGradient: const LinearGradient(colors: [
        Colors.white,
        kpurpleColor,
        Colors.tealAccent,
        kredcolor,
        Colors.yellow,
        Colors.cyanAccent,
        Colors.deepOrangeAccent,
        Colors.white,
      ]),
    );
  }
}

