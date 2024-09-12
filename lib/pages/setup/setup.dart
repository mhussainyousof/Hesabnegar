// lib/setup.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:me/controllers/cupertino_controller.dart';
import 'package:me/models/money.dart';
import '../auth/controller/password_controller.dart';

Future<void> setup() async {
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MoneyModelAdapter());
  await Hive.openBox<MoneyModel>('moneyBox');
  await Hive.openBox<String>('passwordBox');
  await Hive.openBox('settings');
  
  // Initialize Awesome Notifications
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'key1',
      channelName: 'Proto Coders Point',
      channelDescription: 'Notification example',
      playSound: true,
      enableLights: true,
      enableVibration: true,
      defaultColor: const Color(0xff9050dd),
      ledColor: Colors.white,
    )
  ]);
  
  // Set up Cron jobs
  final cron = Cron();
  cron.schedule(
    Schedule.parse('0 10 * * *'),
    () async {
      if (Get.find<CupertinoController>().ison.value) {
        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: 'سلام دوست من'.tr,
            body: 'آیا امروز دخل و خرج خودت را نوشتی؟'.tr,
          ),
        );
      }
    },
  );
  
  // Put controllers in GetX dependency injection
  Get.put(PasswordController());
}
