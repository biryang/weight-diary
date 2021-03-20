import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:weight_diary/models/diary_model.dart';

class DiaryData extends ChangeNotifier {
  // List<DiaryModel> _tasks = [];
  // Set<String> _tags = Set();
  //
  // UnmodifiableListView<DiaryModel> get tasks {
  //   return UnmodifiableListView(_tasks);
  // }
  // UnmodifiableListView<String> get tags {
  //   return UnmodifiableListView(_tags);
  // }
  //
  // int get taskCount {
  //   return _tasks.length;
  // }
  //
  // void getTask() async {
  //   Set<String> tag = Set();
  //
  //   _tasks = await dbHelper.getTasks();
  //
  //   for (var task in _tasks) {
  //     tag.add(task.tag);
  //   }
  //
  //   _tags = tag;
  //
  //   notifyListeners();
  // }
  //
  // Future<void> addTask(String newText, String newTag) async {
  //   await dbHelper.insertTask(TaskModel(
  //       text: newText,
  //       tag: newTag,
  //       done: 'uncheck',
  //       time: DateTime.now().toString()));
  //
  //   getTask();
  // }
  //
  // void removeTask(TaskModel task) {
  //   _tasks.remove(task);
  //   dbHelper.deleteTask(task.id);
  //
  //   getTask();
  // }
  //
  // void toggleTask(TaskModel task) async {
  //   String done = task.done == 'uncheck' ? 'check' : 'uncheck';
  //   dbHelper.updateTask(TaskModel(
  //       id: task.id,
  //       text: task.text,
  //       tag: task.tag,
  //       done: done,
  //       time: task.time));
  //
  //   getTask();
  // }
  //
  // void reset() {
  //   dbHelper.dropTable();
  //   dbHelper.addTable();
  // }
}