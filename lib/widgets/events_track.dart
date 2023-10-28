import 'package:flutter/material.dart';
import 'package:music_store/widgets/TrackDelete.dart';
import 'package:music_store/widgets/TrackEdit.dart';
import 'package:music_store/widgets/alert.dart';
import 'package:music_store/widgets/track.dart';

Widget EventTrack({required key, required Track widget, required BuildContext context, Function? callback}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: InkWell(
        key: key,
        onTap: () {
          AlertBox(context: context,
              child: TrackEdit(context: context,
                  title: widget.title,
                  author: widget.author,
                  album: widget.album,
                  id: widget.id,
                  callback: callback),
              dismissible: false);
        },
        onLongPress: () {
          AlertBox(context: context,
              child: TrackDelete(
                  context: context, id: widget.id, callback: callback),
              dismissible: false);
        },
        child: widget
    ),
  );
}