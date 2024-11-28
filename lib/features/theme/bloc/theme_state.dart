import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// 直接使用static持久的对象，不每次都new instance的前提是，保证不会连续发出两个一样的状态
sealed class ThemeState extends Equatable{
  static const LightThemeState light = LightThemeState();
  static const DarkThemeState dark = DarkThemeState();

  final bool _isLight;
  const ThemeState(this._isLight);

  //getter
  bool get isLight => _isLight;
  //==, 仅仅使用isLight来判断是否相等
  @override
  List<Object> get props => [_isLight];

  ThemeMode getThemeMode() {
    return _isLight ? ThemeMode.light : ThemeMode.dark;
  }
}


class LightThemeState extends ThemeState {
  const LightThemeState() : super(true);
}


class DarkThemeState extends ThemeState {
  const DarkThemeState() : super(false);
}