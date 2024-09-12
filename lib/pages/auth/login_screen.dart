import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../../widgets/textfiled.dart';
import 'controller/password_controller.dart';

class LoginPage extends StatelessWidget {
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 171, 14),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 219, 171, 14),
              Colors.orangeAccent,
            ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'ورود به برنامه'.tr,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                //! PASSWORD PLACE
                CustomTextField(
                  widthOftextField: 280,
                  filled: false,
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  controller: passwordController,
                  labelText: 'گذرواژه'.tr,
                  lablecolor: Colors.white,
                  prefixIconData: Icons.lock,
                  suffixIconData: Icons.visibility,
                  color2: kredcolor,
                  obscureText: true,
                  hintText: 'گذرواژه را وارد کنید'.tr,
                  
                ),
                const SizedBox(height: 16),

                //! CHECK BUTTON IF PASSWORD IS CORRECT
                ElevatedButton(
                  onPressed: () {
                    if (Get.find<PasswordController>()
                        .validatePassword(passwordController.text)) {
                    
                      Get.offAllNamed('/homescreen');
                    } else {
                      Get.snackbar('خطا'.tr, 'پسور اشتباه می باشد'.tr);
                    }
                  },
                  style: const ButtonStyle(
                      shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: WidgetStatePropertyAll(kredcolor)),
                  child:  Text(
                    'ورود'.tr,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
