import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BmiSlider extends StatelessWidget {
  BmiSlider({this.value, this.left, this.right});

  double value = 0;
  int left = 1;
  int right = 100;

  int leftValue() {
    if (value <= 20) {
      return left - 10;
    } else if (value <= 21) {
      return left;
    } else if (value <= 22) {
      return (left * 1.5).toInt();
    } else if (value <= 23) {
      return left * 2;
    } else if (value <= 24) {
      return left * 3;
    } else if (value <= 25) {
      return left * 4;
    } else if (value <= 30) {
      return left * 7;
    } else if (value >= 30) {
      return left * 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              Color(0xff6490ff),
              Color(0xff6490ff),
              Color(0xff6490ff),
              Color(0xff6ff65f),
              Color(0xff6ff65f),
              Color(0xfffad75d),
              Color(0xfffad75d),
              Color(0xffff5e5e),
              Color(0xffff5e5e),
              Color(0xffff5e5e),
              Color(0xffff5e5e),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            children: [
              Expanded(
                flex: leftValue(),
                child: SizedBox(),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Text(
                  '${value.toStringAsFixed(1)}',
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: right,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SliderTheme(
// data: SliderTheme.of(context).copyWith(
// activeTrackColor: Colors.white.withOpacity(1),
// thumbColor: Colors.black,
// inactiveTrackColor: Colors.white.withOpacity(.4),
// trackHeight: 4.0,
// overlayColor: Colors.white.withOpacity(.4),
// valueIndicatorColor: Colors.white,
// activeTickMarkColor: Colors.white,
// inactiveTickMarkColor: Colors.red.withOpacity(.7),
// thumbShape: CustomSliderThumbRect(
// max: 10,
// min: 0,
// thumbHeight: 50,
// thumbRadius: 10,
// ),
// ),
// child: Slider(
// value: 5,
// max: 10,
// onChanged: (value) {},
// ),
// )
