import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class HistoryCard extends StatefulWidget {
  const HistoryCard({
    Key key,
  }) : super(key: key);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
  CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
  Tween<double>(begin: 0.0, end: 0.5);

  AnimationController _controller;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
  }


  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('2021-03-15'),
                    Text('0.5kg'),
                    Icon(Icons.keyboard_arrow_down_rounded),
                    Icon(Icons.keyboard_arrow_up_rounded),
                    Text(
                      '62.5kg',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                _isExpanded ? Text('daily memo') : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
