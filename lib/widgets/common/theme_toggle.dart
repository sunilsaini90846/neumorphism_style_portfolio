import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return GestureDetector(
      onTap: () {
        themeProvider.toggleTheme();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeProvider.isDarkMode
              ? const Color(0xFF2D2F3A)
              : const Color(0xFFF0F0F3),
          boxShadow: [
            BoxShadow(
              color: themeProvider.isDarkMode
                  ? const Color(0xFF1E1F29).withOpacity(0.7)
                  : const Color(0xFFBEBEBE).withOpacity(0.7),
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: themeProvider.isDarkMode
                  ? const Color(0xFF3C3E4D)
                  : const Color(0xFFFFFFFF),
              offset: const Offset(-4, -4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: themeProvider.isDarkMode ? 30 : 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themeProvider.isDarkMode
                      ? const Color(0xFF8F88FF)
                      : const Color(0xFF6C63FF),
                  boxShadow: [
                    BoxShadow(
                      color: themeProvider.isDarkMode
                          ? const Color(0xFF1E1F29).withOpacity(0.7)
                          : const Color(0xFFBEBEBE).withOpacity(0.7),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    themeProvider.isDarkMode
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 