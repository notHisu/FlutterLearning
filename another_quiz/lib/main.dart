import 'package:another_quiz/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:another_quiz/pages/select_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/selectpage': (context) => const SelectPage(),
      },
    );
  }
}
