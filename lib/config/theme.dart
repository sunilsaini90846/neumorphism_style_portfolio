import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color lightBackgroundColor = Color(0xFFF0F0F3);
  static const Color darkBackgroundColor = Color(0xFF2D2F3A);
  
  static const Color lightShadowColor = Color(0xFFBEBEBE);
  static const Color lightHighlightColor = Color(0xFFFFFFFF);
  
  static const Color darkShadowColor = Color(0xFF1E1F29);
  static const Color darkHighlightColor = Color(0xFF3C3E4D);
  
  static const Color lightTextColor = Color(0xFF2D2F3A);
  static const Color darkTextColor = Color(0xFFF0F0F3);
  
  static const Color lightAccentColor = Color(0xFF6C63FF);
  static const Color darkAccentColor = Color(0xFF8F88FF);
  
  static const Color lightCardColor = Color(0xFFF0F0F3);
  static const Color darkCardColor = Color(0xFF2D2F3A);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackgroundColor,
    primaryColor: lightAccentColor,
    colorScheme: const ColorScheme.light(
      primary: lightAccentColor,
      secondary: Color(0xFF03DAC6),
      background: lightBackgroundColor,
      surface: lightCardColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: lightTextColor,
      onSurface: lightTextColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).apply(
      bodyColor: lightTextColor,
      displayColor: lightTextColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: lightTextColor),
      titleTextStyle: TextStyle(
        color: lightTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardTheme(
      color: lightCardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    iconTheme: const IconThemeData(
      color: lightTextColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightAccentColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightAccentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lightAccentColor,
        side: const BorderSide(color: lightAccentColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightBackgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: lightAccentColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackgroundColor,
    primaryColor: darkAccentColor,
    colorScheme: const ColorScheme.dark(
      primary: darkAccentColor,
      secondary: Color(0xFF03DAC6),
      background: darkBackgroundColor,
      surface: darkCardColor,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onBackground: darkTextColor,
      onSurface: darkTextColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(
      bodyColor: darkTextColor,
      displayColor: darkTextColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: darkTextColor),
      titleTextStyle: TextStyle(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardTheme(
      color: darkCardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    iconTheme: const IconThemeData(
      color: darkTextColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkAccentColor,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkAccentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkAccentColor,
        side: const BorderSide(color: darkAccentColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkCardColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: darkAccentColor),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
  );
}

// Neumorphic box decoration for light theme
BoxDecoration neuLightDecoration({
  double borderRadius = 15,
  Color? color,
  bool isPressed = false,
  bool isInverted = false,
}) {
  return BoxDecoration(
    color: color ?? AppTheme.lightBackgroundColor,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: isPressed
        ? [
            BoxShadow(
              color: AppTheme.lightShadowColor.withOpacity(0.7),
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: AppTheme.lightHighlightColor,
              offset: Offset(-4, -4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ]
        : isInverted
            ? [
                BoxShadow(
                  color: AppTheme.lightShadowColor.withOpacity(0.7),
                  offset: const Offset(4, 4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: AppTheme.lightHighlightColor,
                  offset: Offset(-4, -4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : [
                BoxShadow(
                  color: AppTheme.lightShadowColor.withOpacity(0.7),
                  offset: const Offset(4, 4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: AppTheme.lightHighlightColor,
                  offset: Offset(-4, -4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
  );
}

// Neumorphic box decoration for dark theme
BoxDecoration neuDarkDecoration({
  double borderRadius = 15,
  Color? color,
  bool isPressed = false,
  bool isInverted = false,
}) {
  return BoxDecoration(
    color: color ?? AppTheme.darkBackgroundColor,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: isPressed
        ? [
            BoxShadow(
              color: AppTheme.darkShadowColor.withOpacity(0.7),
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: AppTheme.darkHighlightColor,
              offset: Offset(-4, -4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ]
        : isInverted
            ? [
                BoxShadow(
                  color: AppTheme.darkShadowColor.withOpacity(0.7),
                  offset: const Offset(4, 4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: AppTheme.darkHighlightColor,
                  offset: Offset(-4, -4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : [
                BoxShadow(
                  color: AppTheme.darkShadowColor.withOpacity(0.7),
                  offset: const Offset(4, 4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: AppTheme.darkHighlightColor,
                  offset: Offset(-4, -4),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
  );
}

// Neumorphic inner shadow box decoration for light theme
BoxDecoration neuLightInnerDecoration({
  double borderRadius = 15,
  Color? color,
}) {
  return BoxDecoration(
    color: color ?? AppTheme.lightBackgroundColor,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: AppTheme.lightHighlightColor.withOpacity(0.5),
        offset: const Offset(4, 4),
        blurRadius: 8,
        spreadRadius: -3,
      ),
      BoxShadow(
        color: AppTheme.lightShadowColor.withOpacity(0.7),
        offset: const Offset(-4, -4),
        blurRadius: 8,
        spreadRadius: -3,
      ),
    ],
  );
}

// Neumorphic inner shadow box decoration for dark theme
BoxDecoration neuDarkInnerDecoration({
  double borderRadius = 15,
  Color? color,
}) {
  return BoxDecoration(
    color: color ?? AppTheme.darkBackgroundColor,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: AppTheme.darkHighlightColor.withOpacity(0.5),
        offset: const Offset(4, 4),
        blurRadius: 8,
        spreadRadius: -3,
      ),
      BoxShadow(
        color: AppTheme.darkShadowColor.withOpacity(0.7),
        offset: const Offset(-4, -4),
        blurRadius: 8,
        spreadRadius: -3,
      ),
    ],
  );
} 