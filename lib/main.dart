import 'package:bmi/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 14, 42, 65),
        scaffoldBackgroundColor: Color(0xff141413),
      ),
      home: MainScreen(),
    );
  }
}
