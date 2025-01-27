import 'package:flutter/material.dart';

class ThemeChange extends ChangeNotifier {
  bool isDarkTheme = false;

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
  }

  ThemeData get currentTheme => isDarkTheme ? ThemeData.dark() : ThemeData.light();

  static of(BuildContext context) {}
}
