import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddScreen extends StatelessWidget {
  DateTime now = DateTime.now();
  DateRangePickerController _controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'New Weight',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Calendar',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                _getVerticalCalendar(),
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
                        'Calendar',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                TextField(),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.book,
                        color: Colors.white70,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Calendar',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                TextField(),
              ],
            ),
          ),
        );
      },
    );
  }

  SfDateRangePicker _getVerticalCalendar() {
    return SfDateRangePicker(
      view: DateRangePickerView.month,
      maxDate: DateTime.now(),
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        print(args.value);
      },
    );
  }
}
