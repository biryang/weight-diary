import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_diary/components/bmi_slider.dart';
import 'package:weight_diary/components/chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weight_diary/components/history_list.dart';
import 'package:weight_diary/components/icon_title.dart';
import 'package:weight_diary/models/diary_data.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double height = 0;
  double weight = 0;
  double bmi = 0;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    Provider.of<DiaryData>(context, listen: false).getContacts();
    Provider.of<DiaryData>(context, listen: false).getHeight();

    init();
    super.initState();
  }

  void init() async {
    _controller.text =
        await Provider.of<DiaryData>(context, listen: false).getHeight();
  }

  @override
  Widget build(BuildContext context) {
    weight = Provider.of<DiaryData>(context, listen: true).getContact(0).weight;
    bmi = (height != 0 && weight != 0) ? weight / ((height / 100) * 2) : 0;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTitle(
                        icon: FontAwesomeIcons.book,
                        text: 'Diary',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.wb_sunny),
                            onPressed: () {
                              Provider.of<DiaryData>(context, listen: false)
                                  .setThemeData(true);
                              Provider.of<DiaryData>(context, listen: false)
                                  .getThemeData();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.nightlight_round),
                            onPressed: () {
                              Provider.of<DiaryData>(context, listen: false)
                                  .setThemeData(false);
                              Provider.of<DiaryData>(context, listen: false)
                                  .getThemeData();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  IconTitle(
                    icon: Icons.aspect_ratio_rounded,
                    text: 'BMI',
                  ),
                  BmiSlider(
                    value: bmi,
                    left: bmi.toInt(),
                    right: 100,
                  ),
                  const Divider(),
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
                            controller: _controller,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 13.5, horizontal: 10),
                              // border: OutlineInputBorder(),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0x807b7b7b)),
                              ),
                              hintText: 'Enter a Height',
                              hintStyle: TextStyle(fontSize: 15),
                              suffixText: 'cm',
                              prefixText: '    ',
                            ),
                            onChanged: (value) {
                              Provider.of<DiaryData>(context, listen: false)
                                  .setHeight(value);
                              setState(() {
                                height = double.parse(value);
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0x807b7b7b),
                                    style: BorderStyle.solid,
                                    width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Now'),
                                    Text(
                                      '${weight}kg',
                                      style: TextStyle(
                                        fontSize: 25,
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
                  const Divider(),
                  IconTitle(
                    icon: FontAwesomeIcons.chartArea,
                    text: 'Chart',
                  ),
                  BmiLineChart(
                    diaryData:
                        Provider.of<DiaryData>(context, listen: true).diary,
                    max: Provider.of<DiaryData>(context).weightMax,
                  ),
                  const Divider(),
                  IconTitle(
                    icon: FontAwesomeIcons.history,
                    text: 'History',
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      child: HistoryList(
                        listCount: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
