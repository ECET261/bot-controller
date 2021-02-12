import 'package:flutter/material.dart';
import 'package:jtest/pages/about.dart';
import 'package:jtest/pages/home.dart';
import 'package:jtest/pages/loading.dart';
import 'package:jtest/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bot Controller',
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => HomePage(),
        '/settings': (context) => Settings(),
        '/about': (context) => About(),
      },
    );
  }
}
