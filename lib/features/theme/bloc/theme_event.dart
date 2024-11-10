sealed class ThemeEvent{
  static const ToggleThemeEvent toggleThemeEvent = ToggleThemeEvent();
  const ThemeEvent();
}

class ToggleThemeEvent extends ThemeEvent {
  // 无参数
  const ToggleThemeEvent();
}