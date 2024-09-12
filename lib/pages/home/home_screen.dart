import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'package:me/constant.dart';
import 'package:me/controllers/hive_controller.dart';
import 'package:me/controllers/manage_errors/dialog.dart';
import 'package:me/pages/add_edit_transaction/controller/radio_controller.dart';
import 'package:me/widgets/drawer.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../add_edit_transaction/controller/date_controller.dart';
import 'controller/list_controller.dart';
import '../translate/controller/taranslate.dart';
import '../../controllers/textfield_controller.dart';
import '../../models/money.dart';
import 'widget/main_float_button.dart';
import '../../widgets/main_navigatin_widget.dart';
import '../add_edit_transaction/transaction_screen.dart';
import 'widget/empty_widget.dart';
import 'widget/list_tile.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  

  void onInit() {}
   HomeScreen({super.key});
  var value = 2;
  @override
  Widget build(BuildContext context) {
TextEditingController searchController = TextEditingController();

  var isEnglish = Get.find<TranslateController>().currentLanguage == 'en';
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: ()async {
        bool shouldExit = await showExitDialog();
        return shouldExit;
      },
      child: SafeArea(
        
          child: Scaffold(
            bottomNavigationBar: const MyNavigationbarWidget(),
        resizeToAvoidBottomInset: false,
        drawer: DrawerWidget(),
          floatingActionButton: MainFloatingWidget(
            backgroundColor: kredcolor,
            onPressed: () {
              Get.find<TextFieldController>().description!.text = '';
              Get.find<TextFieldController>().pprice!.text = '';
              Get.find<DateController>().addNewDate();
      
              Get.find<RadioController>().setSelectedValue(value);
              Get.find<HiveController>().getData();
      
              Get.to(() => TransactionScreen());
              Get.find<ListController>().isEditing = false;
            },
            heroTag: 'uniqueTag1',
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
      
        //
        //
        //! HEADER PART
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 7,
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
              Container(
              height: 38,
              width: 38,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: isEnglish ? const Color(0xfffeaf2a) : const Color(0xffffbf00)
              ),
              child: Builder(
                builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black54,
                        size: 26,
                      ));
                }
              ),
            ),
            
            Expanded(
              child: SizedBox(
                height: 45,
                child: SearchBarAnimation(
                  
                    buttonElevation: 0,
                    enableBoxShadow: false,
                    enableButtonShadow: false,
                   hintText: 'اینجا سرچ کنید'.tr,enteredTextStyle: const TextStyle(letterSpacing: 1) ,enableKeyboardFocus: false,
                   durationInMilliSeconds: 90,
                    buttonColour: const Color.fromARGB(100, 255, 174, 4),
                    
                    // : isEnglish ? true : false,
                    searchBoxColour: Colors.amber.shade200,
                    textEditingController:
                        searchController,
                    isOriginalAnimation: false,
                    onFieldSubmitted: (String text) {
                      List<MoneyModel> result = Get.find<HiveController>()
                          .hiveBox
                          .values
                          .where((value) =>
                              value.title!.contains(text) ||
                              value.date!.contains(text))
                          .toList();
                      Get.find<ListController>().moneys.clear();
                      for (var value in result) {
                        Get.find<ListController>().moneys.add(value);
                      }
                    },
                    onCollapseComplete: () {
                      Get.find<HiveController>().getData();
                      Get.find<ListController>().clearSearch();
                    },
                    trailingWidget: const Icon(Icons.foggy, size: 1,),
                    secondaryButtonWidget: const Icon(Icons.close,),
                    buttonWidget: const Icon(
                      Icons.search,
                      color: Colors.black54,size: 30,
                    )),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            
            
            LanguageButton(),
            ],)
          ),
          //! second container
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 25, right: 12, left: 17),
              width: Get.width,
              height: Get.height * 0.9 - 67,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(20))),
              child:  Column(
                children: [
                 Obx(() => Expanded(
                    child: Get.find<ListController>().moneys.isEmpty
                        ? const EmptyWidget()
                        : const ListTileWidget())),
                ],
              ),
            ),
          ),
        ]),
      
        //
        //
        //
      )),
    );
  }
}





 Future<bool> showExitDialog() async {
    return await Get.dialog(
      ShowDialogTwoButtonWidget(
        text1: 'خروج'.tr,
        fontSize1: 17.0,
        text2: 'آیا میخواهید از برنامه خارج شوید؟'.tr,
        fontSize2: 15.0,
        textbuttonRight: 'خیر'.tr,
        textbuttonLeft: 'بلی'.tr,
        onpressedRight: () {
          Get.back(); // بسته شدن دیالوگ بدون خروج از برنامه
        },
        onpressedLeft: () async {
          await SystemNavigator.pop(); // خروج از برنامه
        },
        child: Container(), // محتوای دلخواه خود را می‌توانید اینجا قرار دهید
      ),
    ) ??
        false; // اگر هیچ پاسخی داده نشود، مقدار false برگردانده می‌شود.
  }
