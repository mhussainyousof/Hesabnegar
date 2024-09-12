import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
// import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:me/controllers/hive_controller.dart';
import 'package:me/controllers/manage_errors/snackbar.dart';
import 'package:me/pages/translate/controller/taranslate.dart';
import '../../constant.dart';
import 'controller/date_controller.dart';
import '../home/controller/list_controller.dart';
import 'controller/radio_controller.dart';
import '../../controllers/textfield_controller.dart';
import '../../models/money.dart';

class TransactionScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
   TransactionScreen({super.key});

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
                width: 90.0,
              ),
               Text(
                      Get.find<ListController>().isEditing
                          ? 'ویرایش تراکنش'.tr
                          : 'تراکنش جدید'.tr,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )),
            ],
          ),
        ),
        //! second container
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 30, right: 12, left: 17),
            width: Get.width,
            height: Get.height * 0.9 - 17,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20))),
            child:  Column(
              children: [
               Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  TransTextfieldWidget(
                    controller: Get.find<TextFieldController>().description,
                    text: 'توضیحات'.tr,
                    textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                  TransTextfieldWidget(
                    controller: Get.find<TextFieldController>().pprice,
                    text: 'مبلغ'.tr,
                    textDirection:TextDirection.ltr,
                    type: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const DateAndTypeWidget(),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButtonWidget(
                    formKey: _formKey,
                    index: 0,
                  )
                ],
              ),
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


class TextButtonWidget extends StatelessWidget {
  final int index;
  final GlobalKey<FormState>? formKey;

  const TextButtonWidget({
    required this.index,
    this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            backgroundColor: WidgetStateProperty.all(kredcolor)),
        onPressed: () {
          if (Get.find<DateController>().selectedDate.value.isEmpty || !(formKey!.currentState?.validate() ?? true)) {
            MySnackBar.showCustomSnackBar(
                title: 'خطا'.tr,
                TextColor2: Colors.black,
                message: 'لطفا فیلد ها را تکمیل نمائید'.tr,
                Iconcolor: Colors.red,
                TextColor1: Colors.black);
          } else {
            if (Get.find<ListController>().isEditing) {
              var money = Get.find<ListController>()
                  .moneys[Get.find<ListController>().index];
              money.isReceived =
                  Get.find<RadioController>().selectedValue == 0.obs
                      ? true
                      : false;
              money.title = Get.find<TextFieldController>().description!.text;
              money.price = Get.find<TextFieldController>().pprice!.text;
              Get.find<HiveController>()
                  .hiveBox
                  .putAt(Get.find<ListController>().index, money);
              Get.find<ListController>()
                  .moneys[Get.find<ListController>().index] = money;
              money.date = Get.find<DateController>().selectedDate.value;
            } else {
              Get.find<HiveController>().hiveBox.add(MoneyModel(
                    title: Get.find<TextFieldController>().description!.text,
                    price: Get.find<TextFieldController>().pprice!.text,
                    date: Get.find<DateController>().selectedDate.value,
                    isReceived:
                        Get.find<RadioController>().selectedValue == 0.obs
                            ? true
                            : false,
                  ));
            }
            Get.find<HiveController>().getData();
            Get.back();
          }
        },
        child: Text(
          Get.find<ListController>().isEditing ? 'اعمال تغییرات'.tr : 'اضافه کردن'.tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class DateAndTypeWidget extends StatelessWidget {
  const DateAndTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Radio(
              activeColor: kredcolor,
              value: 0,
              groupValue: Get.find<RadioController>().selectedValue.value,
              onChanged: (value) {
                Get.find<RadioController>().setSelectedValue(value!);
              }),
           Expanded(child: Text('دریافتی'.tr)),
          Radio(
              activeColor: kredcolor,
              value: 1,
              groupValue: Get.find<RadioController>().selectedValue.value,
              onChanged: (value) {
                Get.find<RadioController>().setSelectedValue(value!);
              }),
           Expanded(child: Text('پرداختی'.tr)),
          Expanded(
            child: InkWell(
              onTap: () {
                if (Get.find<ListController>().isEditing) {
                  var money = Get.find<ListController>()
                      .moneys[Get.find<ListController>().index];
                  Get.find<DateController>().pickDate(context,
                      isEditing: true, initialDate: money.date);
                  Get.find<ListController>().isEditing = true;
                  Get.find<ListController>()
                      .moneys[Get.find<ListController>().index] = money;
                } else {
                  Get.find<DateController>().pickDate(context);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
      
                  Get.find<DateController>().selectedDate.value.isEmpty
                      ? 'تاریخ'.tr
                      : Get.find<DateController>().selectedDate.value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,

                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class TransTextfieldWidget extends StatelessWidget {
  final String text;
  final TextInputType type;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final FormFieldValidator<String>? validator;

  const TransTextfieldWidget({
    super.key,
    required this.text,
    this.type = TextInputType.text,
    this.controller,
    this.textDirection,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    var isEnglish = Get.find<TranslateController>().currentLanguage == 'en';
    return TextFormField(
      textDirection: textDirection,
      controller: controller ?? TextEditingController(),
      keyboardType: type,
      validator: validator,
      decoration: InputDecoration(
        hintTextDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
        hintText: text,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
