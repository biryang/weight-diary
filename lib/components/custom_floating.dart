import 'package:flutter/material.dart';

class CustomFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
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
          )),
      onPressed: () {},
    );
  }
}
