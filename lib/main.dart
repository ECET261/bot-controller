import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/home.dart';
import 'pages/settings.dart';

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
