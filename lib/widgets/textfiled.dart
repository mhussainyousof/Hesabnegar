//! Custom Textfield
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/auth/controller/password_controller.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final _obscureTextVisible = false.obs;
  final String? hintText;
  final double? size;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final BorderSide borderSide;
  final Color? color;
  final Color? color2;
  final bool? filled;
  final Color? lablecolor;
  final double? widthOftextField;

  CustomTextField(
      {super.key,
      required this.labelText,
      this.prefixIconData,
      this.suffixIconData,
      this.obscureText = false,
      this.hintText,
      this.size,
      this.controller,
      this.onChanged,
      required this.borderSide,
      this.color,
      this.color2,
      this.filled,
      this.lablecolor,
      this.widthOftextField});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: widthOftextField ?? 325,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText ? !_obscureTextVisible.value : false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            fillColor: Colors.white,
            filled: filled ?? true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        Get.find<PasswordController>().isPasswordIncorrect.value
                            ? Colors.red
                            : borderSide.color,
                    width: 2),
                borderRadius: BorderRadius.circular(10)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: hintText,
            labelText: labelText,
            labelStyle: TextStyle(color: lablecolor ?? Colors.black87),
            prefixIcon: Icon(
              prefixIconData,
              size: size,
              color: color ?? Colors.black54,
            ),
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureTextVisible.value
                          ? suffixIconData
                          : Icons.visibility_off,
                      color: color2,
                    ),
                    onPressed: () => _obscureTextVisible.toggle(),
                  )
                : Icon(
                    suffixIconData,
                    color: color2,
                  ),
          ),
        ),
      ),
    );
  }
}
