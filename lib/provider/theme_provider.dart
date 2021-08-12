import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color _accentColor = Color(0xFFFFBF01);

  Color get accentColor {
    return _accentColor;
  }

  void changeAccentColor(Color color) {
    _accentColor = color;
    notifyListeners();
  }
}
