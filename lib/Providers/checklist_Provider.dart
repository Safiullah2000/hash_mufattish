import 'package:flutter/material.dart';

class ChecklistProvider extends ChangeNotifier {
  Map _items = {};

  Map get items => _items;

  void additems(List checklist) {
    checklist.forEach((element) {
      _items[element] = "";
    });
  }

  void changeValue(String title, String value) {
    _items[title] = value;
    print(_items);
    notifyListeners();
  }
}
