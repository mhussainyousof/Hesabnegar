//! شودیالوگ با دو دکمه ---------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:me/constant.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
class ShowDialogTwoButtonWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String textbuttonRight;
  final String textbuttonLeft;
  final double? fontSize1;
  final double? fontSize2;
  final Function() onpressedRight;
  final Function() onpressedLeft;
  const ShowDialogTwoButtonWidget({
    super.key,
    required this.text1,
    this.fontSize1,
    this.fontSize2,
    required this.text2,
    required this.textbuttonRight,
    required this.textbuttonLeft,
    required this.onpressedRight,
    required this.onpressedLeft, required child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BlurryContainer(
        width: 300,
        height: 200,
        borderRadius: BorderRadius.circular(20.0),
        elevation: 0.5,
        blur: 20,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! متن بولد اول
            Text(
              text1,
              style:  TextStyle(
                  fontSize: fontSize1 ?? 15.0,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold
                  ),
            ),
            const SizedBox(
              height: 30.0,
            ),

            //! متن زیر
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                text2,
                style:  TextStyle(
                    fontSize: fontSize2 ??10.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //
            //
            //
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //! دکمه ی سمت چپ
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size.fromHeight(1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      onpressedLeft();
                    },
                    child: Text(
                      textbuttonLeft,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                //! دکمه ی سمت راست
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size.fromHeight(1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: kredcolor,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      onpressedRight();
                    },
                    child: Text(
                      textbuttonRight,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            //
            //
            //
          ],
        ),
      ),
    );
  }
}