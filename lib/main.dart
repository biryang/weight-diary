import 'package:flutter/material.dart';
import 'package:weight_diary/components/custom_floating.dart';
import 'package:weight_diary/screens/add_screen.dart';
import 'package:weight_diary/screens/chart_screen.dart';
import 'package:weight_diary/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'models/diary_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider(
        create: (context) => DiaryData(),
        child: SafeArea(
          child: Material(
            child: Scaffold(
              body: PageView(
                  onPageChanged: (value) {
                    print(value);
                  },
                  children: [
                    MainScreen(),
                    AddScreen(),
                    HistoryScreen(),
                  ]),
              floatingActionButton:true ? CustomFloating() : null,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        ),
      ),
    );
  }
}
