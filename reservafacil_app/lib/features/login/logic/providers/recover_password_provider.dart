import 'package:flutter/material.dart';

class RecoverPasswordProvider with ChangeNotifier {
  int index = 0;
  int steps = 3;

  void nextStep() {
    // index++;
    if (index == steps) {
      index = 3;
    } else {
      index++;
    }

    notifyListeners();
  }

  void previousStep() {
    if (index == 0) {
      index = 0;
    } else {
      index--;
    }

    notifyListeners();
  }

  void reset() {
    index = 0;
    notifyListeners();
  }
}
