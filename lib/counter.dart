import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class Counter {
  int _value = 0;

  void incrementeValue() {
    _value++;
  }

  int getValue() {
    return _value;
  }
}

class TimedCounter with ChangeNotifier {
  final Counter _counter = Counter();

  Timer? _timer;

  void _startCounter() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _incrementCounter();
      //print("start couter = " + _counter.getValue().toString());
    });
  }

  void _stopCounter() {
    _timer?.cancel();

    _timer = null;
    print("stop counter = " + _counter.getValue().toString());
  }

  void _incrementCounter() {
    _counter.incrementeValue();
    notifyListeners();
    print("increment couter = " + _counter.getValue().toString());
  }

  int getValue() {
    return _counter.getValue();
  }

  void toggleCounter() {
    if (_timer != null) {
      _stopCounter();
    } else {
      _startCounter();
    }
  }

  bool isTimerActive() {
    return (_timer != null);
  }
}
