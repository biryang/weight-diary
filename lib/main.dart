import 'package:flutter/material.dart';
import 'package:weight_diary/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Material(
          child: MainScreen(),
        ),
      ),
    );
  }
}
