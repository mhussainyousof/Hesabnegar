import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoDaryaftyWidget extends StatelessWidget {
  final String firsttext;
  final String firstpice;
  final String secondtext;
  final String secondprice;
  const InfoDaryaftyWidget(
      {super.key,
      required this.firsttext,
      required this.firstpice,
      required this.secondtext,
      required this.secondprice});

  @override
  Widget build(BuildContext context) {
    var isEnglish = Get.locale?.languageCode == 'en';
    return Padding(
      padding: const EdgeInsets.only(top: 5, right:6, bottom: 10, left: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: isEnglish ? _buildEnglishLayout() : _buildFarsiLayout(),
      ),
    );
  }

  List<Widget> _buildFarsiLayout() {
    return [

      Expanded(child: Text(secondtext.tr, style: const TextStyle(fontSize: 13),)),
      Expanded(
          child: Text(
        secondprice,
        textAlign: TextAlign.right, style: const TextStyle(fontSize: 13),
      )),
      // const Spacer(),
      //
      Expanded(child: Text(firsttext.tr, style: const TextStyle(fontSize: 13),)),
      Text(
        firstpice,
        textAlign: TextAlign.right, style: const TextStyle(fontSize: 13),
      ),
    ];
  }

  List<Widget> _buildEnglishLayout() {
    return [
      Text(secondtext.tr, style: const TextStyle(fontSize: 13),),
      Expanded(
        child: Text(
          secondprice,
          textAlign: TextAlign.right, style: const TextStyle(fontSize: 13),
        ),
      ),
      const Spacer(),
      Text(firsttext.tr, style: const TextStyle(fontSize: 13),),
      Expanded(
        child: Text(
          firstpice,
          textAlign: TextAlign.right, style: const TextStyle(fontSize: 13),
        ),
      ),
    ];
  }
}