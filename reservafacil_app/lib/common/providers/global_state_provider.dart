import 'package:flutter/material.dart';

class GlobalStateProvider with ChangeNotifier {

  bool isDarkMode = false;
  bool isLoading = false;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void setTheme(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

}