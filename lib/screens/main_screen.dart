import 'package:flutter/material.dart';
import 'package:weight_diary/components/history_card.dart';

import 'chart.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff16172f),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Diary'),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: LineChartSample2(),
          ),
          Container(
            child: Text('62.5kg'),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'BMI',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'History',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
          HistoryCard(),
          HistoryCard(),
        ],
      ),
    );
  }
}
