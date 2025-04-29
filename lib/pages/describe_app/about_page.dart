import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:me/pages/translate/controller/taranslate.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isEnglish = Get.find<TranslateController>().currentLanguage == 'en';
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
                  Color(0xFFFFAB40),
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
                width: 140.0,
              ),
               Text(
                'درباره'.tr,
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
            padding: const EdgeInsets.only(top: 25, right: 12, left: 17),
            width: Get.width,
            height: Get.height * 0.9 - 6,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20))),
            child:  Column(
              children: [
                isEnglish ?
                const Text('''
This program is created which you can manage and control your finances more easily, you can write your daily income and expenses with a title and date, and you can also see a chart of your daily, monthly and yearly income and expenses. For more security, you can use the ability to set a password so that your information is protected... 
And one more thing: Activate the daily reminder to send you a daily notification to enter the expenses.
Sincerely, Mohammad Hussain Yousof😊🤖
         ''', textAlign: TextAlign.justify,
                  style: TextStyle(height: 2, fontSize: 15),)
                :const Text(
                  '''
این برنامه ساخته شد تا بتونید راحت تر مدیریت مالی خودتون رو انجام بدین و کنترولش کنید، میتونید درآمد و مخارج روزانه رو با ذکر عنوان و تاریخ بنویسید، همچنین شما قادرید که نموداری از درآمد و مخارج روزانه، ماهانه و سالانه خود را ببینید. برای امنیت بیشتر شما میتونید از قابلیت تنظیم گذرواژه استفاده کنید تا معلومات شما محفوظ بماند... 
و یک نکته دیگه😊: یاد آور روزانه رو فعال کنید تا اعــلان روزانه برای درج هزینه ها براتون فرســتاده بشه
با احترام، محمد حسین یوسف👨‍💻🤖
        ''',
                  textAlign: TextAlign.justify,
                  style: TextStyle(height: 2, fontSize: 15),
                ),
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  height: 30,
                ),
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
