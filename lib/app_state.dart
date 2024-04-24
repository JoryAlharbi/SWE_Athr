import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _swipableListIndex =
          prefs.getInt('ff_swipableListIndex') ?? _swipableListIndex;
    });
    _safeInit(() {
      _recentSearches =
          prefs.getStringList('ff_recentSearches') ?? _recentSearches;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _timerRunning = false;
  bool get timerRunning => _timerRunning;
  set timerRunning(bool value) {
    _timerRunning = value;
  }

  int _swipableListIndex = 0;
  int get swipableListIndex => _swipableListIndex;
  set swipableListIndex(int value) {
    _swipableListIndex = value;
    prefs.setInt('ff_swipableListIndex', value);
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  bool _swarchActive2 = false;
  bool get swarchActive2 => _swarchActive2;
  set swarchActive2(bool value) {
    _swarchActive2 = value;
  }

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;
  set recentSearches(List<String> value) {
    _recentSearches = value;
    prefs.setStringList('ff_recentSearches', value);
  }

  void addToRecentSearches(String value) {
    _recentSearches.add(value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeFromRecentSearches(String value) {
    _recentSearches.remove(value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeAtIndexFromRecentSearches(int index) {
    _recentSearches.removeAt(index);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void updateRecentSearchesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _recentSearches[index] = updateFn(_recentSearches[index]);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void insertAtIndexInRecentSearches(int index, String value) {
    _recentSearches.insert(index, value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  DocumentReference? _workshopType;
  DocumentReference? get workshopType => _workshopType;
  set workshopType(DocumentReference? value) {
    _workshopType = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
