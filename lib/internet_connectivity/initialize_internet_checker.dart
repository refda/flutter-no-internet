import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:no_internet_check/internet_connectivity/static_index.dart';

import 'navigation_Service.dart';

class InternetChecker {
  InternetChecker([Widget? page]) {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          if (IndexClass.index == 1) {
            IndexClass.index = 0;
            NavigationService.popScreen();
          }
          break;
        case InternetConnectionStatus.disconnected:
          print('Data connection is not available.');
          IndexClass.index = 1;
          NavigationService.navigateTo(page);
          break;
      }
    });
  }
}
