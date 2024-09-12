import 'package:hive/hive.dart';


part 'money.g.dart'; 

@HiveType(typeId:0)
class MoneyModel {
  @HiveField(1)
  String? title; 
  @HiveField(2)
  String? price;
  @HiveField(3)
  String? date;
  @HiveField(4)
  bool? isReceived;
  

  MoneyModel(
      {required this.title,
      required this.price,
      required this.date,
      required this.isReceived});
}
