import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
part 'diary.g.dart';

@HiveType(typeId: 0)
class Diary extends HiveObject{
  Diary({@required this.date, @required this.weight, this.note});

  @HiveField(0)
  double weight;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  String note;
}
