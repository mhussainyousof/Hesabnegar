import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:me/pages/auth/controller/password_controller.dart';

import '../../constant.dart';
import '../../widgets/textfiled.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passController = TextEditingController();
    final confPassController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,

      //
      //
      //! HEADER PART
      body: Stack(alignment: Alignment.bottomCenter, children: [
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
                width: 90.0,
              ),
               Text(
                'تنظیم گذرواژه'.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17),
              ),
            ],
          ),
        ),
        //! second container
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
                  'گذرواژه  را تنظیم کنید'.tr,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),

                //! First passwod textfield
                CustomTextField(
                  controller: passController,
                  borderSide:
                      BorderSide(color: Colors.amber.shade500, width: 2.0),
                  onChanged: (value) {
                    Get.find<PasswordController>()
                        .passwordController
                        .value
                        .text = value;
                  },
                  labelText: 'گذرواژه'.tr,
                  prefixIconData: Icons.lock,
                  suffixIconData: Icons.visibility,
                  obscureText: true,
                  hintText: 'گذرواژه را وارد کنید'.tr,
                ),
                //
                //
                const SizedBox(
                  height: 25,
                ),
                //
                //! Second confirm Textfield
                CustomTextField(
                  controller: confPassController,
                  onChanged: (value) {
                    Get.find<PasswordController>()
                        .confirmPasswordController
                        .value
                        .text = value;
                  },
                  borderSide:
                      BorderSide(color: Colors.amber.shade500, width: 2.0),
                  labelText: 'تایید گذرواژه'.tr,
                  prefixIconData: Icons.lock_reset,
                  size: 33,
                  suffixIconData: Icons.visibility,
                  color: Colors.black54,
                  obscureText: true,
                  hintText: 'گذرواژه را تایید کنید'.tr,
                ),
                //
                //
                const SizedBox(
                  height: 19,
                ),
                //
                //! Save password button
                SizedBox(
                    width: 330,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.find<PasswordController>().setPassword();
                        
                        passController.text = '';
                        confPassController.text = '';
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

      //
      //
      //
    ));
  }
}

