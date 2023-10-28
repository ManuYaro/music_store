import 'package:music_store/api/controller_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_store/constants/colors.dart';

Widget TrackDelete({required BuildContext context, required int id, Function? callback}) {
  var size = MediaQuery
      .of(context)
      .size;
  return Container(
    width: size.width * 2 / 3,
    height: size.height * 1 / 8,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
    padding: EdgeInsets.all(12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text("Cancel", style: TextStyle(color: green),)),
        TextButton(onPressed: () async
        {
          await BaseClient().delete("deleteDisc/$id");
          Navigator.pop(context);
          //refresh
          callback?.call();
        }, child: Text("Delete", style: TextStyle(color: green),)),
      ],
    ),
  );
}