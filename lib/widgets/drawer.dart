import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:me/controllers/manage_errors/dialog.dart';
import 'package:me/pages/books/books_screen.dart';
import 'package:me/pages/setting/setting.dart';
import '../pages/describe_app/about_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/info_screen/info_screen.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  Widget? child;
  DrawerWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        DrawerHeader(
          duration: const Duration(milliseconds: 12),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/financial.jpg',
                ),
                fit: BoxFit.cover),
            color: Colors.amber,
          ),
          child: child,
        ),
        ListTile(
          title: Row(
            children: [
              const Icon(Icons.settings),
              const SizedBox(
                width: 20,
              ),
              Text('تنظیمات'.tr),
            ],
          ),
          onTap: () {
            Get.to(() => Setting());
          },
        ),
        ListTile(
          title: Row(
            children: [
              const Icon(Icons.bar_chart),
              const SizedBox(
                width: 20,
              ),
              Text('گزارشات'.tr),
            ],
          ),
          onTap: () {
            Get.to(() => const InfoScreen());
          },
        ),
        ListTile(
          title: Row(
            children: [
              const Icon(Icons.info),
              const SizedBox(
                width: 20,
              ),
              Text('درباره'.tr),
            ],
          ),
          onTap: () {
            Get.to(() => const AboutScreen());
          },
        ),
        ListTile(
          title: Row(
            children: [
              const Icon(Icons.attach_money_rounded),
              const SizedBox(
                width: 20,
              ),
              Text('لیست کتاب ها'.tr),
            ],
          ),
          onTap: () {
            Get.to(() => const BooksScreen());
          },
        ),
        ListTile(
          title: Row(
            children: [
              const Icon(Icons.exit_to_app),
              const SizedBox(
                width: 20,
              ),
              Text('خروج'.tr),
            ],
          ),
          onTap: () {
            Get.dialog(ShowDialogTwoButtonWidget(
                text1: 'خروج'.tr,
                fontSize1: 17.0,
                text2: 'آیا میخواهید از برنامه خارج شوید؟'.tr,
                fontSize2: 15.0,
                textbuttonRight: 'خیر'.tr,
                textbuttonLeft: 'بلی'.tr,
                onpressedRight: () {
                  // navigator!.pop(context);
                  Get.back();
                },
                onpressedLeft: () async {
                  await SystemNavigator.pop();
                },
                child: child));
          },
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Column(children: [
          Text(
            'راه های ارتباطی:'.tr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  const url = 'https://t.me/mhussainyousof';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'could not launch $url';
                  }
                },
                child: Image.asset('assets/images/telegram2.png',
                    width: 30, height: 30),
              ),
              InkWell(
                onTap: () async {
                  const url = 'https://mhussainyousof.github.io/';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'could not launch $url';
                  }
                },
                child: Image.asset('assets/images/pngegg.png',
                    width: 30, height: 30),
              ),
              InkWell(
                onTap: () async {
                  const url = 'https://wa.me/989025719260';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'could not launch $url';
                  }
                },
                child: Image.asset('assets/images/whatsapp.png',
                    width: 35, height: 35),
              )
            ],
          ),
        ])
      ]),
    );
  }
}

