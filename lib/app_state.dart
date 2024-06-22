import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _clicked = prefs.getInt('ff_clicked') ?? _clicked;
    });
    _safeInit(() {
      _IsAnswered = prefs.getBool('ff_IsAnswered') ?? _IsAnswered;
    });
    _safeInit(() {
      _create = prefs.getInt('ff_create') ?? _create;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _completedQuestions = 0;
  int get completedQuestions => _completedQuestions;
  set completedQuestions(int value) {
    _completedQuestions = value;
  }

  int _score = 0;
  int get score => _score;
  set score(int value) {
    _score = value;
  }

  int _buttonState = 1;
  int get buttonState => _buttonState;
  set buttonState(int value) {
    _buttonState = value;
  }

  int _clicked = 0;
  int get clicked => _clicked;
  set clicked(int value) {
    _clicked = value;
    prefs.setInt('ff_clicked', value);
  }

  bool _IsAnswered = false;
  bool get IsAnswered => _IsAnswered;
  set IsAnswered(bool value) {
    _IsAnswered = value;
    prefs.setBool('ff_IsAnswered', value);
  }

  int _create = 0;
  int get create => _create;
  set create(int value) {
    _create = value;
    prefs.setInt('ff_create', value);
  }

  bool _SearchActive = false;
  bool get SearchActive => _SearchActive;
  set SearchActive(bool value) {
    _SearchActive = value;
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
