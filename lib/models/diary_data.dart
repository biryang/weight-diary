import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weight_diary/databaes/db_helper.dart';
import 'package:weight_diary/models/diary_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiaryData extends ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();

  // Initialize our list of contacts
  List<DiaryModel> _diary = [];
  String _height;
  dynamic _theme = true;

  UnmodifiableListView<DiaryModel> get diary {
    return UnmodifiableListView(_diary);
  }

  /// Get Contacts
  void getContacts() async {
    _diary = await databaseHelper.getDiary();

    notifyListeners();
  }

  /// Get Diary
  DiaryModel getContact(index) {
    if (_diary.length != 0) {
      return _diary[index];
    } else {
      return DiaryModel(weight: 0);
    }
  }

  double get weightMax {
    double max = 0;
    for (var data in _diary) {
      if (max <= data.weight) {
        max = data.weight;
      }
    }
    return max;
  }

  /// Diary Count
  int get diaryCount {
    return _diary.length;
  }

  /// Add Diary
  void addContact(DiaryModel newContact) async {
    await databaseHelper.insertDiary(newContact);
    getContacts();
  }

  /// Delete Diary
  void deleteContact(int id) async {
    databaseHelper.deleteDiary(id);
    getContacts();
  }

  /// Edit Diary
  void editContact({DiaryModel contact, int contactKey}) async {
    getContacts();
  }

  /// Edit Rest
  void resetContact() async {
    databaseHelper.dropTable();
    databaseHelper.addTable();
  }

  void setHeight(String height) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('height', height);
    notifyListeners();
  }

  Future<String> getHeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _height = prefs.getString('height');
    notifyListeners();
    return _height;
  }

  void setThemeData(bool theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', theme);
    notifyListeners();
  }

  void getThemeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _theme = prefs.getBool('theme');
    notifyListeners();
  }

  dynamic get theme {
    if (_theme == true) {
      return ThemeData.light();
    } else {
      return ThemeData.dark();
    }
  }

  String get height {
    return _height;
  }
}
