import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:weight_diary/components/icon_title.dart';
import 'package:provider/provider.dart';
import 'package:weight_diary/models/diary_model.dart';
import 'package:weight_diary/models/diary_data.dart';

class AddScreen extends StatelessWidget {
  DateTime newDate = DateTime.now();
  double newWeight;
  String newNote;

  void _addDiary(context) {
    print(newDate);
    print(newWeight);
    print(newNote);
    Provider.of<DiaryData>(context, listen: false).addContact(
      DiaryModel(
        date: newDate.toString(),
        weight: (newWeight != null) ? newWeight : 0,
        note: (newNote != null) ? newNote : '',
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
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
                      Container(
                        height: 230,
                        child: _getVerticalCalendar(),
                      ),
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
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                          ),
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
                          backgroundColor: Theme.of(context).accentColor,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _addDiary(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
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
