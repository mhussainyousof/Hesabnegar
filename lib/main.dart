import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/bindings/bindings.dart';
import 'package:me/pages/translate/controller/taranslate.dart';
import 'package:me/pages/setup/setup.dart';
import 'package:me/pages/splash/splash_screen.dart';
import 'package:me/pages/translate/translate.dart';
import 'package:me/routes/routes.dart';


void main(List<String> args) async {
 
await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
          locale: const Locale('en', 'US'),
          translations: Translate(),
          theme: ThemeData(fontFamily: 'roboto'),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            var isEnglish =
                Get.find<TranslateController>().currentLanguage == 'en';
            return Directionality(
              textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
              child: child!,
            );
          },
          home: const SplashScreen(),
          initialBinding: MyBindings(),
          initialRoute: '/SplashScreen',
          getPages: Routes.pages,
        );
  }
}
