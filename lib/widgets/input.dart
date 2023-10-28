import 'package:flutter/material.dart';
import 'package:music_store/constants/colors.dart';
//widget for the input
Widget Input({required int maxLines, int? maxLength, required TextInputType keyboardType, required TextEditingController controller, String hintText = '', String defaultValue = '', List inputFormatters = const [], bool passwordField = false}) {
  if (defaultValue.isNotEmpty)
    controller.text = defaultValue;
  return Container(
      height: maxLines == 1 ? 40 : null,
      decoration: BoxDecoration(
//border: Border.all(color: green)
      ),
      child: TextField(
        obscureText: passwordField,
        controller: controller,
        inputFormatters: [...inputFormatters],
        maxLines: maxLines,
        maxLength: maxLength,
        keyboardType: keyboardType,
        cursorColor: green,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(10),
          fillColor: Colors.white,
          hoverColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1),
              borderSide: BorderSide(width: 1, color: green)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1),
              borderSide: BorderSide(width: 1, color: green)
          ),
        ),
      ));
}