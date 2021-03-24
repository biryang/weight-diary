import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weight_diary/components/history_list.dart';
import 'package:weight_diary/components/icon_title.dart';

/// This is the stateless widget that the main application instantiates.
class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String dropdownValue = 'Day';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              IconTitle(
                icon: FontAwesomeIcons.history,
                text: 'History',
                color: Colors.white,
                fontSize: 20,
              ),
              Divider(),
              Expanded(
                child: HistoryList(
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
