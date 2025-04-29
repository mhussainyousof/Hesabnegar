
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:me/utils/calculate.dart';
import 'package:me/widgets/header_widget.dart';
import 'widgets/chart_widget.dart';
import '../../widgets/drawer.dart';
import '../../widgets/main_navigatin_widget.dart';
import 'widgets/info.dart';


class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
              drawer: DrawerWidget(),
        bottomNavigationBar: const MyNavigationbarWidget(),
      resizeToAvoidBottomInset: false,
        body: Stack(alignment: Alignment.bottomCenter, children: [
          HeaderWidget(
            height: Get.height * 0.9,
            children:[ 
            
        InkWell(
              onTap: (){
                Get.back();
              },
              child: const Icon(Icons.arrow_back, color: Colors.black54,size: 27,),
            ),
          const Spacer(),
          Padding(padding: const EdgeInsets.only(top: 5.0),
          child: Text( 'مدیریت تراکنش ها'.tr,
          textAlign: TextAlign.center,
          
          style: const TextStyle(fontWeight: FontWeight.bold,
          fontSize: 19.0,
          color: Colors.white
          ),


          ),
          ),
        const Spacer(),
        ]),

            //! second container
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 7, right: 7, left: 3,),
                width: Get.width,
                height: Get.height * 0.9 - 65,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(20))),
                child:  SingleChildScrollView(
                  child: Column(
                    children: [
                      InfoDaryaftyWidget(
                          firsttext: 'دریافتی امروز: '.tr,
                          firstpice: Calculate().dToday().toStringAsFixed(0),
                          secondtext: 'پرداختی امروز: '.tr,
                          secondprice: Calculate().pToday().toStringAsFixed(0)),
                      InfoDaryaftyWidget(
                          firsttext: 'دریافتی ماه: '.tr,
                          firstpice: Calculate().dMonth().toStringAsFixed(0),
                          secondtext: 'پرداختی ماه: '.tr,
                          secondprice: Calculate().pMonth().toStringAsFixed(0),
                          ),
                      InfoDaryaftyWidget(
                          firsttext: 'دریافتی امسال: '.tr,
                          firstpice: Calculate().dyear().toStringAsFixed(0),
                          secondtext: 'پرداختی امسال: '.tr,
                          secondprice: Calculate().pYear().toStringAsFixed(0),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                      //!chart
                      
                     Calculate().pYear() == 0 && Calculate().dyear() == 0 ? Container() : const SizedBox(
                      height: 300,
                      child: MyBarchart()),
                    ],
                  ),
                ),
              ),
            ),
          ]),
      ),
    );
  }
}
