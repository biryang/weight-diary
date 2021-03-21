import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:weight_diary/databaes/db_helper.dart';
import 'package:weight_diary/models/diary_model.dart';

class DiaryData extends ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();

  // Initialize our list of contacts
  List<DiaryModel> _diary = [];

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
    return _diary[index];
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
  void deleteContact(DiaryModel oldContact) async {
    databaseHelper.deleteDiary(oldContact.id);
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
}
