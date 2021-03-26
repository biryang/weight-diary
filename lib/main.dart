import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:weight_diary/screens/add_screen.dart';
import 'package:provider/provider.dart';
import 'package:weight_diary/screens/page_screen.dart';
import 'models/diary_data.dart';

bool theme = false;

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DiaryData(),
      child: Consumer<DiaryData>(
        builder: (context, diaryData, child) {
          return MaterialApp(
            theme: diaryData.theme,
            routes: {
              '/': (context) => PageScreen(),
              '/add': (context) => AddScreen(),
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
