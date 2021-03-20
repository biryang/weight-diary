import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:weight_diary/components/icon_title.dart';
import 'package:provider/provider.dart';
import 'package:weight_diary/models/diary.dart';
import 'package:weight_diary/models/diary_data.dart';

class AddScreen extends StatelessWidget {
  DateTime newDate = DateTime.now();
  double newWeight;
  String newNote;

  void _addDiary(context){
    // Provider.of<DiaryData>(context, listen: false).addContact(
    //   Diary(
    //     date: newDate,
    //     weight: (newWeight != null) ? newWeight : 0,
    //     note: (newNote != null) ? newNote : '',
    //   ),
    // );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconTitle(
                    icon: Icons.add,
                    text: 'New Weight',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  Divider(),
                  IconTitle(
                    icon: Icons.calendar_today,
                    text: 'Calendar',
                  ),
                  _getVerticalCalendar(),
                  Divider(),
                  IconTitle(
                    icon: FontAwesomeIcons.weight,
                    text: 'Weight',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a Weight',
                        hintStyle: TextStyle(fontSize: 20),
                        suffixText: 'kg',
                        prefixText: '    ',
                      ),
                      onChanged: (value) {
                        newWeight = double.parse(value);
                      },
                    ),
                  ),
                  Divider(),
                  IconTitle(
                    icon: FontAwesomeIcons.book,
                    text: "Note",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(),
                      onChanged: (value) {
                        newNote = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton.icon(
                    icon: Icon(
                      Icons.add,
                      size: 20,
                    ),
                    label: Text('New Diary'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Color(0xff1afdd4),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _addDiary(context);
                      print(newDate);
                      print(newWeight);
                      print(newNote);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SfDateRangePicker _getVerticalCalendar() {
    return SfDateRangePicker(
      view: DateRangePickerView.month,
      initialSelectedDate: DateTime.now(),
      maxDate: DateTime.now(),
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        newDate = args.value;
      },
    );
  }
}
