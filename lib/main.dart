import 'package:flutter/material.dart';
import 'package:weight_diary/components/custom_floating.dart';
import 'package:weight_diary/screens/add_screen.dart';
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
          child: Scaffold(
            body: AddScreen(),
            floatingActionButton: CustomFloating(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ),
        ),
      ),
    );
  }
}
