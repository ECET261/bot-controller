import 'package:flutter/material.dart';
import 'package:pibot/pages/about.dart';
import 'package:pibot/pages/home.dart';
import 'package:pibot/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'piBot',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/settings': (context) => Settings(),
        '/about': (context) => About(),
      },
    );
  }
}
