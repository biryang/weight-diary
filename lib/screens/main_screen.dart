import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weight_diary/components/bmi_slider.dart';
import 'package:weight_diary/components/chart.dart';
import 'package:weight_diary/components/custom_floating.dart';
import 'package:weight_diary/components/history_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weight_diary/components/icon_title.dart';
import 'package:provider/provider.dart';
import 'package:weight_diary/models/diary_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DiaryData>(context, listen: false).getContacts();

    return Scaffold(
      floatingActionButton: CustomFloating(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconTitle(
                  icon: FontAwesomeIcons.book,
                  text: 'Diary',
                  color: Colors.white,
                  fontSize: 20,
                ),
                Icon(Icons.wb_sunny),
                Icon(Icons.nightlight_round),
              ],
            ),
            Divider(),
            IconTitle(
              icon: Icons.aspect_ratio_rounded,
              text: 'BMI',
            ),
            BmiSlider(),
            Divider(),
            IconTitle(
              icon: FontAwesomeIcons.weight,
              text: 'Status',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        border: OutlineInputBorder(),
                        hintText: 'Enter a Height',
                        hintStyle: TextStyle(fontSize: 15),
                        suffixText: 'cm',
                        prefixText: '    ',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: Colors.white38,
                              style: BorderStyle.solid,
                              width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Now'),
                              Text(
                                '62.5kg',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            IconTitle(
              icon: FontAwesomeIcons.chartArea,
              text: 'Chart',
            ),
            BmiLineChart(),
            Divider(),
            IconTitle(
              icon: FontAwesomeIcons.history,
              text: 'History',
            ),
            IconButton(
              onPressed: () {
                print('${Provider.of<DiaryData>(context).diaryCount}');
              },
              icon: Icon(Icons.add),
            ),
            HistoryCard(),
            HistoryCard(),
          ],
        ),
      ),
    );
  }
}
