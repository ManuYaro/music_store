import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_store/constants/colors.dart';
import 'package:music_store/widgets/input.dart';
import 'package:music_store/api/controller_template.dart';

Widget TrackEdit({required BuildContext context, String title = "", String author = "", String album = "", int? id, Function? callback}) {
  var size = MediaQuery
      .of(context)
      .size;
  var titleController = TextEditingController(text: title);
  var albumController = TextEditingController(text: album);
  var authorController = TextEditingController(text: author);
  return Container(
    width: size.width * 2 / 3,
    height: size.height * 1 / 3,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
    padding: EdgeInsets.all(12),
    child: Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Input(maxLines: 1,
                  hintText: "title",
                  keyboardType: TextInputType.text,
                  controller: titleController)),
              Expanded(child: Input(maxLines: 1,
                  hintText: "author",
                  keyboardType: TextInputType.text,
                  controller: authorController)),
              Expanded(child: Input(maxLines: 1,
                  hintText: "album",
                  keyboardType: TextInputType.text,
                  controller: albumController)),
            ],
          ),
        ),
        Row(
          children: [
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Cancel", style: TextStyle(color: green),)),
            TextButton(onPressed: () async
            {
              if (id != null) {
                await BaseClient().put("updateDisc/$id", {
                  "title": titleController.text,
                  "author": authorController.text,
                  "album": albumController.text
                });
              }
              else {
                await BaseClient().post("addDisc", {
                  "title": titleController.text,
                  "author": authorController.text,
                  "album": albumController.text
                });
              }
//refresh
              callback?.call();
              Navigator.pop(context);
            }, child: Text("Add", style: TextStyle(color: green),)),
          ],
        )
      ],
    ),
  );
}