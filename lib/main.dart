import 'package:flutter/material.dart';
import 'package:intro_ui_app/screens/home_screen.dart';
import 'package:intro_ui_app/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        IntroPage.id: (context) => const IntroPage(),
      },
    );
  }
}
