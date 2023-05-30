import 'package:flutter/material.dart';
import 'package:healthproject/screen/homepage.dart';
import 'package:healthproject/screen/Profil/about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const routename = "/about";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tentang Kami',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage(),
    );
  }
}
