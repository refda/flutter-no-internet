import 'package:flutter/material.dart';

import 'connectivty_Screen.dart';

class NavigationService {
  static GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  static void pop() {
    return _navigationKey.currentState!.pop();
  }

  static Future<dynamic> navigateTo(Widget? page) {
    return _navigationKey.currentState!.push(
        MaterialPageRoute(builder: (context) => page ?? ConnectivityScreen()));
  }

  static void popScreen() {
    _navigationKey.currentState!.pop();
  }
}
