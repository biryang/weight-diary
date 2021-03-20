import 'package:flutter/foundation.dart';

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class DiaryModel {
  DiaryModel({@required this.date, @required this.weight, this.note});

  @HiveField(0)
  double weight;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  String note;
}
