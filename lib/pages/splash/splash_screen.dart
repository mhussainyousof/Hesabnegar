import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:me/constant.dart';
import 'package:me/pages/auth/controller/password_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<PasswordController>
    (
      init:PasswordController(),
      
      builder: (context){
      return Scaffold(
      backgroundColor:kamberColor ,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        Text('به اپلیکیشن مدیریت مالی خوش آمدید'.tr, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
        const SizedBox(height: 10,),
        Image.asset('assets/images/bissness.gif',width: 300,)])
      ),

    );
    });
  }
}