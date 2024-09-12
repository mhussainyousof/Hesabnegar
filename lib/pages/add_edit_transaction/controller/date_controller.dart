import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as pdp;
class DateController extends GetxController {
  var selectedDate = ''.obs;

  void pickDate(BuildContext context, {bool isEditing = false, String? initialDate}) async {
    pdp.Jalali? picked;
    if (isEditing && initialDate != null) {
      // تبدیل تاریخ اولیه به شیء Jalali
      List<String> dateParts = initialDate.split('/');
      pdp.Jalali initialJalaliDate = pdp.Jalali(int.parse(dateParts[0]), int.parse(dateParts[1]), int.parse(dateParts[2]));
      
      picked = await pdp.showPersianDatePicker(
        context: context,
        initialDate: initialJalaliDate,
        firstDate: pdp.Jalali(1400),
        lastDate: pdp.Jalali(1499),
      );
    } else {
      picked = await pdp.showPersianDatePicker(
        context: context,
        initialDate: pdp.Jalali.now(),
        firstDate: pdp.Jalali(1400),
        lastDate: pdp.Jalali(1499),

      );
    } 
    if (picked != null && picked.toString() != selectedDate.value) {
      selectedDate.value = '${picked.year}/${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}';
    }
  }
  void addNewDate() {
    selectedDate.value = '';
  }
}
