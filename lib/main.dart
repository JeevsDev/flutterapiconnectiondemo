import 'package:flutter/material.dart';
import 'package:flutterapiconnectiontutorial/apidatafetchscreen.dart';
import 'package:flutterapiconnectiontutorial/apidatapostscreen.dart';
import 'package:flutterapiconnectiontutorial/posteddatafetchscreen.dart';
import 'Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}