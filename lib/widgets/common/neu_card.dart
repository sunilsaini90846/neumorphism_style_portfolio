import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class NeuCard extends StatelessWidget {
  final Widget child;
  final double width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final bool isInverted;
  final bool isPressed;
  final VoidCallback? onTap;

  const NeuCard({
    Key? key,
    required this.child,
    this.width = double.infinity,
    this.height,
    this.borderRadius = 15,
    this.padding = const EdgeInsets.all(16),
    this.color,
    this.isInverted = false,
    this.isPressed = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: themeProvider.getNeumorphicDecoration(
          borderRadius: borderRadius,
          color: color ?? themeProvider.backgroundColor,
          isInverted: isInverted,
          isPressed: isPressed,
        ),
        child: child,
      ),
    );
  }
} 