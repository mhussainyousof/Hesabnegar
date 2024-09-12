import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:me/pages/home/widget/main_float_button.dart';
import 'package:popup_menu/popup_menu.dart';

class TranslateController extends GetxController {
  Box<String>? languageBox;
  String get currentLanguage => languageBox?.get('selectedLanguage') ?? 'en';

  @override
  void onInit() {
    super.onInit();
    initLanguageBox();
  }

  Future<void> initLanguageBox() async {
    languageBox = await Hive.openBox<String>('languageBox');
    String? savedLanguage = languageBox!.get('selectedLanguage');
    if (savedLanguage != null) {
      changeLanguage(savedLanguage);
    }
  }

  void changeLanguage(String language) {
    var locale = Locale(language);
    Get.updateLocale(locale);
    languageBox!.put('selectedLanguage', language);
  }
 void showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('زبان را انتخاب نمائید'.tr, textAlign: TextAlign.center,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                
                title:  Text('انگلیسی'.tr, textAlign: TextAlign.center,),
                onTap: () {
                  changeLanguage('en');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title:  Text('فارسی'.tr, textAlign: TextAlign.center,),
                onTap: () {
                  changeLanguage('fa');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}


class LanguageButton extends StatelessWidget {
  final GlobalKey btnKey = GlobalKey();

  LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MainFloatingWidget(
      backgroundColor: const Color.fromARGB(100, 255, 184, 4),
      height: 40,
      width: 40,
      key: btnKey,
      onPressed: () {
        showMenu(context);
        
      },
      heroTag: 'uniqueTag2',
      child: const Icon(
        Icons.language_rounded,
        size: 30,
        color: Colors.black54,
      ),
    );
  }

  void showMenu(BuildContext context) {
    PopupMenu menu = (PopupMenu(items: [
      MenuItem(
        title: 'انگلیسی'.tr,
        textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decorationColor: Colors.amber),
        image: const Icon(
          Icons.sign_language_rounded,
          color: Colors.white,
        ),
      ),
      MenuItem(
        title: 'فارسی'.tr,
        textStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        image: const Icon(
          Icons.sign_language_sharp,
          color: Colors.white,
        ),
      ),
    ], onClickMenu: onClickMenu, context: context));

    menu.show(widgetKey: btnKey);
  }

  void onClickMenu(MenuItemProvider item) {
    TranslateController controller = Get.find();
    String languageCode;
    if(item.menuTitle == 'انگلیسی' || item.menuTitle == 'English'){
      languageCode = 'en';
    }else{
      languageCode = 'fa';
  }
    // item.menuTitle == 'English' ? languageCode = 'en' : languageCode = 'fa';
    controller.changeLanguage(languageCode);
  }

}
