
import 'package:flutter/foundation.dart';
import 'diary.dart';
import 'package:hive/hive.dart';

class DiaryData extends ChangeNotifier {
  // Name our hive box for this data
  String _boxName = "diaryBox";

  // Initialize our list of contacts
  List<Diary> _diary = [];

  // Holds our active contact
  Diary _activeDiary;

  /// Get Contacts
  /// Gets all contacts from the hive box and loads them into our state List
  void getContacts() async {
    var box = await Hive.openBox<Diary>(_boxName);

    // Update our provider state data with a hive read, and refresh the ui
    _diary = box.values.toList();
    notifyListeners();
  }

  /// Get Diary
  /// Retrieves a specific contact from our state
  Diary getContact(index) {
    return _diary[index];
  }

  /// Diary Count
  /// Returns the length of the contact array
  int get diaryCount {
    return _diary.length;
  }

  /// Add Diary
  /// - Saves contact data to Hive box persistent storage
  /// - Updates our List with the hive data by read
  /// - Notifies listeners to update the UI, which will be a consumer of the _contacts List
  void addContact(Diary newContact) async {
    var box = await Hive.openBox<Diary>(_boxName);

    // Add a contact to our box
    await box.add(newContact);

    // Update our provider state data with a hive read, and refresh the ui
    _diary = box.values.toList();
    notifyListeners();
  }

  /// Delete Diary
  void deleteContact(key) async {
    var box = await Hive.openBox<Diary>(_boxName);

    await box.delete(key);

    // Update _contacts List with all box values
    _diary = box.values.toList();

    print("Deleted contact with key: " + key.toString());

    // Update UI
    notifyListeners();
  }

  /// Edit Diary
  /// Overwrites our existing contact based on key with a brand new updated Diary object
  void editContact({Diary contact, int contactKey}) async {
    var box = await Hive.openBox<Diary>(_boxName);

    // Add a contact to our box
    await box.put(contactKey, contact);

    // Update _contacts List with all box values
    _diary = box.values.toList();

    // Update activeContact
    _activeDiary = box.get(contactKey);

    print('New Name Of Diary: ' + contact.note);

    // Update UI
    notifyListeners();
  }

  /// Set an active contact we can notify listeners for
  void setActiveContact(key) async {
    var box = await Hive.openBox<Diary>(_boxName);
    _activeDiary = box.get(key);
    notifyListeners();
  }

  /// Get Active Diary
  Diary getActiveContact() {
    return _activeDiary;
  }
}