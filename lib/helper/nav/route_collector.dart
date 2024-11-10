import 'package:flutter/material.dart';

class RouteCollector {
  static bool _setted = false;
  static Map<String, WidgetBuilder> _routes = {};

  static get routes => _routes;

  // 保证只能初始化一次
  static void init(Map<String, WidgetBuilder> aroutes) {
    assert(!_setted, 'RouteCollector has been initialized');
    _routes = aroutes;
    _setted = true;
  }
}