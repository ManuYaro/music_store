import 'package:flutter/material.dart';
import 'package:music_store/constants/colors.dart';

class Track extends StatefulWidget {
  String title;
  String author;
  String album;
  int id;

  Track(
      {super.key, required this.title, required this.album, required this.author, required this.id});

  @override
  State<Track> createState() => _TrackState();
}
class _TrackState extends State<Track> {
  late String title;
  late String author;
  late String album;
  late int id;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    album = widget.album;
    author = widget.author;
    title = widget.title;
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: lightGreen, borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: Container(
          padding: EdgeInsets.all(8),
          color: black,
          height: 100,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(
                        color: white, fontWeight: FontWeight.bold),),
                    Text(author, style: TextStyle(
                        color: white, fontStyle: FontStyle.italic),),
                    Text(album, style: TextStyle(
                        color: white, fontStyle: FontStyle.italic),),
                  ],
                ),
              ),
              IconButton(onPressed: () {},
                  icon: Icon(Icons.play_circle_fill_outlined, color: white,))
            ],
          ),
        ),
      ),
    );
  }
}