import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:me/controllers/cupertino_controller.dart';
import 'package:me/pages/auth/controller/password_controller.dart';
import 'package:me/pages/translate/controller/taranslate.dart';
import 'package:me/pages/auth/delet_pass.dart';
import 'package:me/pages/auth/set_password.dart';
// import 'package:neumorphic_ui/neumorphic_ui.dart';

class Setting extends StatelessWidget {
  Setting({super.key});
  final PasswordController passsettingController =
      Get.find<PasswordController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
          //! HEADER PART
          Container(
            padding:  const EdgeInsets.only(right: 10, left: 10, top: 15),
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                  colors: [
                    Colors.amber,
                    Colors.orangeAccent,
                  ]),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                    )),
                 const SizedBox(
                  width: 65
                ),
                 const SizedBox(width: 70,),
                 Text(
                  'تنظیـمـات'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17.0),
                ),
              ],
            ),
            //! THE SECOND CONTAINER
          ),
          SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height * 0.9 - 7,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  //!  Choose language of the application
                  InkWell(
                    onTap: () {
                      Get.find<TranslateController>()
                          .showLanguageDialog(context);
                    },
                    child:  ListTile(
                      // contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      leading: const Icon(Icons.language_rounded),
                      title: Text('زبان'.tr),
                      subtitle:  Text('تغییر زبان برنامه'.tr),
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),

                  //
                  //
                  //

                  //!  SET the PASSWORD OF THE APPLICATION
                  InkWell(
                    onTap: () {
                      if (passsettingController.passwordBox.get('password') !=
                          null) {
                            Get.snackbar('خطا'.tr, 'شما قبلا گذرواژه را انتخاب کرده اید'.tr,
                              animationDuration: const Duration(seconds:1),
                                      duration: const Duration(seconds: 2),
                            );
                      } else {
                        Get.to(() => const SetPasswordPage());
                      }
                    },
                    child:  ListTile(
                      leading: const Icon(Icons.lock),
                      title: Text('گذرواژه'.tr),
                      subtitle: Text('تنظیم گذرواژه برای برنامه'.tr),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),

                  //! DELET PASSWORD PART
                  InkWell(
                    onTap: () {
                      if (passsettingController.passwordBox.get('password') !=
                          null) {
                        Get.to(() => DeletPage());
                      } else {
                        //     TextColor2: Colors.black);
                        Get.snackbar('خطا'.tr, 'پسوردی تنظیم نشده است'.tr,
                              animationDuration: const Duration(seconds:1),
                                      duration: const Duration(seconds: 2),
                                      icon: const Icon(Icons.error, color: Colors.red,)
                            );
                      }
                    },
                    child:  ListTile(
                      leading: const Icon(Icons.key),
                      title: Text('حذف گذرواژه'.tr),
                      subtitle: Text('حذف گذرواژه تنظیم شده'.tr),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  //
                  //! REMINDER OF THE APP
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: ListTile(
                          title:  Text('یادآور'.tr),
                          subtitle:
                               Text('تنظیم یادآور روزانه برای برنامه'.tr),
                          trailing: Obx(() => CupertinoSwitch(
                              value: Get.find<CupertinoController>().ison.value,
                              onChanged: (value) {

                                Get.find<CupertinoController>().toggle();
                                if (value) {
                                  Get.snackbar('تبریک'.tr,
                                      'شما یادآور روزانه را فعال نمودید'.tr,
                                      animationDuration: const Duration(seconds:1),
                                      duration: const Duration(seconds: 2),
                                      icon: const Icon(Icons.check_circle, color: Colors.white,)
                                      
                                      );
                                } 
                              }))),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
