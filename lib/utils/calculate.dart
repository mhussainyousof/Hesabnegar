import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../models/money.dart';

Box<MoneyModel> hiveBox = Hive.box<MoneyModel>('moneyBox');
//
String year = Jalali.now().year.toString();
String month = Jalali.now().month.toString().length == 1
    ? '0${Jalali.now().month.toString()}'
    : Jalali.now().month.toString();
String day = Jalali.now().day.toString().length == 1
    ? '0${Jalali.now().day.toString()}'
    : Jalali.now().day.toString();

class Calculate {

  String today(){
    return '$year/$month/$day';
  }

  double pToday(){
   double result = 0;
   for (var value in hiveBox.values){
    if(value.date!.substring(8,10) == day && value.isReceived == false && value.date!.substring(5,7) == month && value.date!.substring(0,4) == year){
      result += double.parse(value.price!);
    }
   }
   return result;
  }
  double dToday(){
   double result = 0;
   for (var value in hiveBox.values){
    if(value.date!.substring(8,10) == day && value.isReceived == true && value.date!.substring(5,7) == month && value.date!.substring(0,4) == year){
      result += double.parse(value.price!);
    }
   }
   return result;
  }
  double pMonth(){
   double result = 0;
   for (var value in hiveBox.values){
    if(value.date!.substring(5,7) == month && value.isReceived == false && value.date!.substring(0,4) == year){
      result += double.parse(value.price!);
    }
   }
   return result;
  }
  double dMonth(){
   double result = 0;
   for (var value in hiveBox.values){
    if(value.date!.substring(5,7)== month && value.isReceived == true && value.date!.substring(0,4)==year){
      result += double.parse(value.price!);
    }
   }
   return result;
  }
  double pYear(){
   double result = 0;
   for (var value in hiveBox.values){
    if(value.date!.substring(0,4) == year && value.isReceived == false){
      result += double.parse(value.price!);
    }
   }
   return result;
  }
  double dyear(){
   double result = 0;
   for (var value in hiveBox.values){
    if(value.date!.substring(0,4) == year && value.isReceived == true){
      result += double.parse(value.price!);
    }
   }
   return result;
  }
}
