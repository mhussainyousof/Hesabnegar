import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../../widgets/textfiled.dart';
import 'controller/password_controller.dart';

class DeletPage extends StatelessWidget {
  final passwordController = TextEditingController();

  DeletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        //
        //
        body: Stack(alignment: Alignment.bottomCenter, children: [
          //! Header PART
          Container(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 16,
            ),
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
                    child: const Icon(Icons.arrow_back, color: Colors.black54)),
                const SizedBox(
                  width: 70.0,
                ),
                 Text(
                  'حذف گذرواژه'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                ),
              ],
            ),
          ),

          //! ABOVE TEXT OF THE TEXTFILED
          SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height * 0.9 - 17,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                   Text(
                    'گذرواژه یی را که قبلا تنظیم نموده اید وارد نمائید'.tr,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //! ENTER PASSWORD TEXTFIELD
                  CustomTextField(
                    controller: passwordController,
                    borderSide:
                        BorderSide(color: Colors.amber.shade500, width: 2.0),
                    labelText: 'گذرواژه'.tr,
                    prefixIconData: Icons.lock,
                    suffixIconData: Icons.visibility,
                    obscureText: true,
                    // hintText: 'گذرواژه را وارد کنید'.tr,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 19,
                  ),

                  //! DELET PASSWORD BUTTON
                  SizedBox(
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {
                          if (Get.find<PasswordController>()
                              .validatePassword(passwordController.text)) {
                            Get.find<PasswordController>().deletePassword();
                            Get.offAllNamed('/settingscreen');
                          } else {
                            Get.snackbar('خطا'.tr, 'پسورد وارد شده اشتباه میباشد'.tr,
                              animationDuration: const Duration(seconds:1),
                                      duration: const Duration(seconds: 2),
                                      icon: const Icon(Icons.warning, color: Colors.red,)
                            );
                          }
                        },
                        style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            backgroundColor:
                                WidgetStateProperty.all(kredcolor)),
                        child:  Text(
                          'ثبت کردن'.tr,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
