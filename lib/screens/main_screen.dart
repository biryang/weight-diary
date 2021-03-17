import 'package:flutter/material.dart';
import 'package:weight_diary/components/history_card.dart';

class MainScreen extends StatelessWidget {
  double _value = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff16172f),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Diary'),
              ),
              Icon(Icons.wb_sunny),
              Icon(Icons.nightlight_round),
            ],
          ),
          Divider(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                  Colors.red,
                  Colors.red
                ])),
            child: Slider(
              inactiveColor: Colors.white,
              activeColor: Colors.white,
              value: 20,
              min: 0,
              max: 30,
              onChanged: (value) {},
            ),
          ),
          Divider(),
          Row(
            children: [
              Container(
                child: Text('62.5kg'),
              ),
              Container(
                child: Text('62.5kg'),
              ),
            ],
          ),
          Divider(),
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
          Divider(),
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
