import 'package:flutter/material.dart';
import 'package:music_store/api/compact_disc.dart';
import 'package:music_store/api/controller_template.dart';
import 'package:music_store/constants/colors.dart';
import 'package:music_store/widgets/TrackEdit.dart';
import 'package:music_store/widgets/alert.dart';
import 'package:music_store/widgets/events_track.dart';
import 'package:music_store/widgets/track.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

  class _HomeState extends State<Home> {
    //list of feched discs
    List<CompactDisc> discs = [];

    //fetch all compacts discs
    Future<void> _fetchCompactDiscs() async {
      var allDiscs = await BaseClient().get("allDiscs") as List;
      discs = allDiscs.map((e) => CompactDisc.fromJson(e)).toList();
      setState(() {});
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _fetchCompactDiscs();
    }

    @override
    Widget build(BuildContext context) {
      var tracks = discs.map<Widget>((disc) =>
          EventTrack(key: GlobalKey(),
              widget: Track(title: disc.title ?? "--",
                  author: disc.author ?? "--",
                  album: disc.album ?? "--",
                  id: disc!.id ?? -1
              ),
              callback: () {
                _fetchCompactDiscs();
              },
              context: context)).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text("Music Store", style: TextStyle(color: black),),
          backgroundColor: green,),
        backgroundColor: black,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: RefreshIndicator(
                color: lightGreen,
                onRefresh: () async
                {
                  _fetchCompactDiscs();
                },
                child: ListView(
                  children: [
                    if (discs.isNotEmpty) ...tracks else
                      Center(child: Column(
                        children: [
                          Text("No data to preview", style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),),
                          SizedBox(height: 12,),
                          CircularProgressIndicator(color: lightGreen,)
                        ],
                      ),)
                  ],
                )
            )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: lightGreen,
          child: Icon(Icons.add, color: white,),
          //child widget inside this button
          onPressed: () {
            AlertBox(context: context,
                child: TrackEdit(context: context, callback: () {
                  _fetchCompactDiscs();
                }));
          },
        ),
      );
    }
  }