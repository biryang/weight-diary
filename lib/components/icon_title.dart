import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconTitle extends StatelessWidget {
  IconTitle({
    this.text,
    this.icon,
    this.color = Colors.white70,
    this.fontSize = 15,
  });

  final String text;
  final IconData icon;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          FaIcon(
            icon,
            // color: Colors.white70,
            size: fontSize + 3,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              // color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
