import 'package:flutter/material.dart';
import 'nav_bar.dart';
import 'footer.dart';

class ScreenLayout extends StatelessWidget {
  final String currentRoute;
  final Widget child;
  final bool showNavBar;
  final bool showFooter;
  final EdgeInsetsGeometry padding;

  const ScreenLayout({
    Key? key,
    required this.currentRoute,
    required this.child,
    this.showNavBar = true,
    this.showFooter = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (showNavBar) NavBar(currentRoute: currentRoute),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: padding,
                    child: child,
                  ),
                  if (showFooter) const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 