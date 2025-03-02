import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;
  bool _isDarkMode = false;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  void _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  BoxDecoration getNeumorphicDecoration({
    double borderRadius = 15,
    Color? color,
    bool isPressed = false,
    bool isInverted = false,
  }) {
    return _isDarkMode
        ? neuDarkDecoration(
            borderRadius: borderRadius,
            color: color,
            isPressed: isPressed,
            isInverted: isInverted,
          )
        : neuLightDecoration(
            borderRadius: borderRadius,
            color: color,
            isPressed: isPressed,
            isInverted: isInverted,
          );
  }

  BoxDecoration getNeumorphicInnerDecoration({
    double borderRadius = 15,
    Color? color,
  }) {
    return _isDarkMode
        ? neuDarkInnerDecoration(
            borderRadius: borderRadius,
            color: color,
          )
        : neuLightInnerDecoration(
            borderRadius: borderRadius,
            color: color,
          );
  }

  Color get backgroundColor =>
      _isDarkMode ? AppTheme.darkBackgroundColor : AppTheme.lightBackgroundColor;

  Color get textColor =>
      _isDarkMode ? AppTheme.darkTextColor : AppTheme.lightTextColor;

  Color get accentColor =>
      _isDarkMode ? AppTheme.darkAccentColor : AppTheme.lightAccentColor;

  Color get cardColor =>
      _isDarkMode ? AppTheme.darkCardColor : AppTheme.lightCardColor;

  Color get shadowColor =>
      _isDarkMode ? AppTheme.darkShadowColor : AppTheme.lightShadowColor;

  Color get highlightColor =>
      _isDarkMode ? AppTheme.darkHighlightColor : AppTheme.lightHighlightColor;
} 