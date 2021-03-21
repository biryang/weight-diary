import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_diary/components/history_card.dart';
import 'package:weight_diary/models/diary_data.dart';

class HistoryList extends StatelessWidget {
  HistoryList({this.listCount});

  final listCount;

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryData>(
      builder: (context, diaryData, child) {
        return ListView.builder(
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            final diary = diaryData.diary[index];
            final changeWeight = index == diaryData.diaryCount-1 ? 0 : diaryData.diary[index].weight - diaryData.diary[index+1].weight;

            // print(changeWeight.abs());
            return HistoryCard(
              date: diary.date,
              weight: diary.weight,
              changeWeight: changeWeight.toDouble(),
              note: diary.note,
            );
          },
          itemCount: (listCount == null || diaryData.diaryCount != 0) ? diaryData.diaryCount : listCount,
        );
      },
    );
  }
}
