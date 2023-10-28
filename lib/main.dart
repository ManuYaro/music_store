import 'package:flutter/material.dart';
import 'package:music_store/constants/pages.dart';
import 'package:music_store/pages/endpoint.dart';
import 'package:music_store/pages/home.dart';
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ENDPOINT,
      routes: {
        HOME: (context) => Home(),
        ENDPOINT: (context) => EndPoint(),
      }
  ));
}