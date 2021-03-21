import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class HistoryCard extends StatefulWidget {
  HistoryCard({this.date, this.weight, this.changeWeight, this.note});

  final String date;
  final double weight;
  final double changeWeight;
  final String note;

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  AnimationController _controller;

  bool _isExpanded = false;

  String upAndDown;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
  }

  void upDown() {
    if (widget.changeWeight == 0) {
      upAndDown = 'keep';
    } else if (widget.changeWeight < 0) {
      upAndDown = 'down';
    } else {
      upAndDown = 'up';
    }
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    upDown();
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                    Expanded(flex: 1, child: Text(widget.date)),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          upAndDown == 'down'
                              ? FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  color: Colors.blue,
                                )
                              : SizedBox(),
                          upAndDown == 'up'
                              ? FaIcon(
                                  FontAwesomeIcons.caretUp,
                                  color: Colors.red,
                                )
                              : SizedBox(),
                          upAndDown == 'keep'
                              ? FaIcon(
                                  FontAwesomeIcons.minus,
                                  size: 15,
                                )
                              : SizedBox(),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '${widget.changeWeight.abs().toStringAsFixed(1)}',
                              style: TextStyle(
                                color: upAndDown == 'up'
                                    ? Colors.red
                                    : upAndDown == 'down'
                                        ? Colors.blue
                                        : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${widget.weight}kg',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                _isExpanded
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Note'),
                          ),
                          Container(
                            width: 500,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(widget.note),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
