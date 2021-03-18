import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weight_diary/components/bmi_slider.dart';
import 'package:weight_diary/components/history_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.book,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Diary',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Icon(Icons.wb_sunny),
              Icon(Icons.nightlight_round),
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.aspect_ratio_rounded,
                  color: Colors.white70,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'BMI',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          BmiSlider(),
          Divider(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.weight,
                  color: Colors.white70,
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Weight',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Previous',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '62.5kg',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '17 Apr 2020',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Now'),
                    Text(
                      '62.5kg',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.history,
                  color: Colors.white70,
                  size: 18,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'History',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          HistoryCard(),
          HistoryCard(),
        ],
      ),
    );
  }
}
