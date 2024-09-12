import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../home/home_screen.dart';
import '../login_screen.dart';

class PasswordController extends GetxController {


  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  Box<String> passwordBox = Hive.box<String>('passwordBox');
  var isPasswordIncorrect = false.obs;

  @override
  void dispose() {
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.dispose();
  }

  @override
  void onReady(){
    navigateToHome();
    super.onReady();
  }
  
//! define the splash screen
  void navigateToHome()async{
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(()=>PasswordController().passwordBox.get('password') != null
          ? LoginPage()
          : HomeScreen());
  }

//! save the password in the database
  void setPassword() {
    final tempPassword = passwordController.value.text;
    final tempConfirmPassword = confirmPasswordController.value.text;

    if (tempPassword.isEmpty || tempConfirmPassword.isEmpty) {
      // نمایش پیام خطا در صورت خالی بودن یکی از تکست‌فیلدها
      Get.snackbar(
        'خطا'.tr,
        'لطفاً هر دو تکست‌فیلد را پر کنید'.tr,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 2),
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
        passwordBox.delete('password');
        isPasswordIncorrect.value = true;
        // Get.find<PasswordController>().isPasswordIncorrect;
        
      return; // خروج از تابع بدون ذخیره‌سازی رمز عبور
    } else if (tempPassword == tempConfirmPassword) {
      passwordBox.put('password', tempPassword);
      Get.snackbar('تبریک'.tr, 'پسورد با موفقیت تنظیم شد'.tr,
          animationDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 2),
          icon: const Icon(
            Icons.check_circle,
          ));
      isPasswordIncorrect.value = false;
    } 
    // else {
    //   Get.snackbar('خطا'.tr, 'پسورد مطابقت ندارد'.tr,
    //       animationDuration: const Duration(seconds: 1),
    //       duration: const Duration(seconds: 2),
    //       icon: const Icon(
    //         Icons.error,
    //         color: Colors.red,
    //       ));

    //   isPasswordIncorrect.value = true;
    // }
  }

  //! check if the password is correct used in login page..
  bool validatePassword(String enteredPassword) {
    return passwordBox.get('password') == enteredPassword;
  }

  //! delete the password used in delete page
  void deletePassword() {
    passwordBox.delete('password');
    // Get.snackbar('Success', 'Password has been deleted successfully');
    Get.snackbar('تبریک'.tr, 'پسورد با موفقیت حذف شد'.tr,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 2),
        icon: const Icon(
          Icons.check_circle,
        ));

        
  }


  
}
