import 'package:flutter/material.dart';
import 'package:weight_diary/components/custom_floating.dart';
import 'package:weight_diary/models/diary.dart';
import 'package:weight_diary/screens/add_screen.dart';
import 'package:weight_diary/screens/history_screen.dart';
import 'package:weight_diary/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

import 'models/diary_data.dart';

void main() {
  Hive.registerAdapter(DiaryAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DiaryData(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        routes: {
          '/' : (context) => MainScreen(),
          '/add':(context)=>AddScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
