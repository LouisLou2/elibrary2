import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyObserver extends NavigatorObserver {
  final List<String> pages = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    // print
    if (kDebugMode) {
      print('@@@@@@@@@@@@@@@@route: $route');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    // print
    if (kDebugMode) {
      print('@@@@@@@@@@@@@@@@newRoute: $newRoute');
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    // print
    if (kDebugMode) {
      print('@@@@@@@@@@@@@@@@route: $route');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // print
    if (kDebugMode) {
      print('@@@@@@@@@@@@@@@@route: $route');
    }
  }
}