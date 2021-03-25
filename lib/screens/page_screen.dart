import 'package:flutter/material.dart';
import 'package:weight_diary/screens/history_screen.dart';
import 'package:weight_diary/screens/main_screen.dart';

class PageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        children: [
          MainScreen(),
          HistoryScreen()
        ],
      ),
    );
  }
}
