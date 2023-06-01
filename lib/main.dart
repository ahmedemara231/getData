import 'package:flutter/material.dart';
import 'package:untitled6/View/home.dart';
import 'package:untitled6/View/login_screen.dart';
import 'package:untitled6/View/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
