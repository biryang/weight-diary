import 'package:flutter/material.dart';

class CustomFloating extends StatelessWidget {
  CustomFloating({this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon:const Icon(
        Icons.add,
        size: 20,
      ),
      label: const Text('New Diary'),
      style: TextButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Theme.of(context).accentColor,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
