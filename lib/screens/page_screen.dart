import 'package:flutter/material.dart';
import 'package:weight_diary/components/custom_floating.dart';
import 'package:weight_diary/screens/history_screen.dart';
import 'package:weight_diary/screens/main_screen.dart';

class PageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: CustomFloating(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: PageView(
          children: [
            MainScreen(),
            HistoryScreen()
          ],
        ),
      ),
    );
  }
}
