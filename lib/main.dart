import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fixit_app/formPage.dart';
import 'package:fixit_app/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      home: Home()
    );
  }
}
