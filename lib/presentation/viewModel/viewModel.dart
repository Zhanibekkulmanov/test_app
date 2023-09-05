import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {

  List colors = [Colors.red];
  List constColors = [Colors.red, Colors.green, Colors.yellow];
  Random random = Random();
  ColorsType _colorType = ColorsType.red;
  int _index = 0;
  int _count = 1;
  bool _isFilled = false;
  double _animationValue = 0.2;

  ColorsType get colorType => _colorType;
  int get index => _index;
  int get count => _count;
  double get animationValue => _animationValue;
  bool get isFilled => _isFilled;

  Color getColor(ColorsType value) {
    if (value == ColorsType.red) {
      return Colors.red;
    } else if (value == ColorsType.yellow) {
      return Colors.yellow;
    } else if (value == ColorsType.green) {
      return Colors.green;
    } return Colors.white;
  }

  set colorType(ColorsType value) {
    _colorType = value;
    notifyListeners();
  }

  set animationValue(double value) {
    _animationValue = value;
    notifyListeners();
  }

  set isFilled(bool value) {
    _isFilled = value;
    notifyListeners();
  }

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  void addColors() {
    _index = random.nextInt(3);
    for(int i=0;i<10;i++) {
      colors.add(constColors[random.nextInt(3)]);
    }
    notifyListeners();
  }

}

enum ColorsType {
  red,
  yellow,
  green,
  none
}