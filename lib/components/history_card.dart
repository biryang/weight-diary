import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weight_diary/models/diary_data.dart';

class HistoryCard extends StatefulWidget {
  HistoryCard({this.id, this.date, this.weight, this.changeWeight, this.note});

  final int id;
  final String date;
  final double weight;
  final double changeWeight;
  final String note;

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  String upAndDown;

  @override
  void initState() {
    super.initState();
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
            color: Color(0x807b7b7b),
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
                              ? const FaIcon(
                                  FontAwesomeIcons.caretDown,
                                  color: Colors.blue,
                                )
                              : const SizedBox(),
                          upAndDown == 'up'
                              ? const FaIcon(
                                  FontAwesomeIcons.caretUp,
                                  color: Colors.red,
                                )
                              : const SizedBox(),
                          upAndDown == 'keep'
                              ? const FaIcon(
                                  FontAwesomeIcons.minus,
                                  size: 15,
                                )
                              : const SizedBox(),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.weight}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text('kg')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Delete?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Provider.of<DiaryData>(context,
                                              listen: false)
                                          .deleteContact(widget.id);
                                      Navigator.pop(context);
                                    },
                                    child: Text('YES')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('NO'))
                              ],
                            );
                          },
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: FaIcon(
                          FontAwesomeIcons.trash,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
                _isExpanded
                    ? Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Note'),
                          ),
                          Container(
                            width: 500,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.black26,
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
