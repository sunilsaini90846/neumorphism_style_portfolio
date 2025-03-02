import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class NeuButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color? color;

  const NeuButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width = 200,
    this.height = 50,
    this.borderRadius = 15,
    this.padding = const EdgeInsets.all(16),
    this.color,
  }) : super(key: key);

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        decoration: themeProvider.getNeumorphicDecoration(
          borderRadius: widget.borderRadius,
          color: widget.color ?? themeProvider.backgroundColor,
          isPressed: _isPressed,
        ),
        child: Center(child: widget.child),
      ),
    );
  }
} 