import 'package:flutter/material.dart';
void AlertBox({required BuildContext context, required Widget child, bool insetPadding = false, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center, bool dismissible = true, Color barrierColor = Colors.black54, double elevation = 2}) {
  showDialog(
      barrierColor: barrierColor,
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) {
        return Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Dialog(
              elevation: elevation,
              insetPadding: insetPadding == true ? EdgeInsets.all(25) : null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              child: child,
            ),
          ],
        );
      });
}