import 'package:flutter/material.dart';

import '../../../constant.dart';

// ignore: must_be_immutable
class MainFloatingWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  double? width;
  double? height;
  final String heroTag;
  Color? backgroundColor;

   MainFloatingWidget({super.key, 
    required this.onPressed,
    required this.child,
    required this.heroTag,
    this.width,
    this.height,
    this.backgroundColor,
    
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 55,
      height: height ?? 55,
      child: FloatingActionButton(
        
        
          elevation: 0,
          
          backgroundColor: backgroundColor ?? kpurpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
           heroTag: heroTag,
           
          onPressed: onPressed,
          
          child: child),
    );
  }
}
