import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/page/error_page.dart';

class RouteGenerator {

  static bool _setted = false;
  static late Map<String, WidgetBuilder> _routes;

  static void init(Map<String, WidgetBuilder> routes) {
    assert(!_setted);
    _routes = routes;
    _setted = true;
  }

  static CupertinoPageRoute<void> getRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  })=>CupertinoPageRoute<void>(
    builder: builder,
    settings: settings,
    fullscreenDialog: fullscreenDialog,
  );

  // 用于根据给定的RouteSettings生成路由。当尝试导航到未定义的命名路由时，将调用此函数来动态生成路由。
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /*simpleRoutes中都是注册在路由表中的，不会触发这个方法，只有路由到simpleRoutes表中的路由地址才会触发这个方法
    * assert (RouteCollector.specialRoutes.contains(settings.name));
    * 对于那些需要特殊处理的路由，我们在这里进行处理*/
    assert(_setted);
    WidgetBuilder builder = _routes[settings.name] ?? (context) => const ErrorPage(message: 'unknown');
    return getRoute(builder: builder, settings: settings);
  }
}