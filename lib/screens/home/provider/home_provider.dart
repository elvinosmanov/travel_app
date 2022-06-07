import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _sortIndex = 0;

  int get sortIndex => _sortIndex;

  set sortIndex(int sortIndex) {
    _sortIndex = sortIndex;
    notifyListeners();
  }
}
