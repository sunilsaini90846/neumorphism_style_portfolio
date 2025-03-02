import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import 'theme_toggle.dart';

class NavBar extends StatelessWidget {
  final String currentRoute;

  const NavBar({
    Key? key,
    required this.currentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: themeProvider.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: themeProvider.shadowColor.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: isMobile
          ? _buildMobileNavBar(context, themeProvider)
          : _buildDesktopNavBar(context, themeProvider),
    );
  }

  Widget _buildDesktopNavBar(BuildContext context, ThemeProvider themeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(themeProvider),
        Row(
          children: [
            _buildNavItem(context, 'Home', '/', themeProvider),
            const SizedBox(width: 24),
            _buildNavItem(context, 'About', '/about', themeProvider),
            const SizedBox(width: 24),
            _buildNavItem(context, 'Skills', '/skills', themeProvider),
            const SizedBox(width: 24),
            _buildNavItem(context, 'Projects', '/projects', themeProvider),
            const SizedBox(width: 24),
            _buildNavItem(context, 'Experience', '/experience', themeProvider),
            const SizedBox(width: 24),
            _buildNavItem(context, 'Contact', '/contact', themeProvider),
            const SizedBox(width: 24),
            const ThemeToggle(),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNavBar(BuildContext context, ThemeProvider themeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(themeProvider),
        Row(
          children: [
            const ThemeToggle(),
            const SizedBox(width: 16),
            IconButton(
              icon: Icon(
                Icons.menu,
                color: themeProvider.textColor,
              ),
              onPressed: () {
                _showMobileMenu(context, themeProvider);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo(ThemeProvider themeProvider) {
    return Text(
      'Sunil Kumar',
      style: TextStyle(
        color: themeProvider.textColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String title,
    String route,
    ThemeProvider themeProvider,
  ) {
    final isActive = currentRoute == route;

    return InkWell(
      onTap: () {
        if (currentRoute != route) {
          context.go(route);
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? themeProvider.accentColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : themeProvider.textColor,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context, ThemeProvider themeProvider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: themeProvider.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: themeProvider.shadowColor.withOpacity(0.3),
                offset: const Offset(0, -4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMobileNavItem(context, 'Home', '/', themeProvider),
              _buildMobileNavItem(context, 'About', '/about', themeProvider),
              _buildMobileNavItem(context, 'Skills', '/skills', themeProvider),
              _buildMobileNavItem(context, 'Projects', '/projects', themeProvider),
              _buildMobileNavItem(context, 'Experience', '/experience', themeProvider),
              _buildMobileNavItem(context, 'Contact', '/contact', themeProvider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileNavItem(
    BuildContext context,
    String title,
    String route,
    ThemeProvider themeProvider,
  ) {
    final isActive = currentRoute == route;

    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? themeProvider.accentColor : themeProvider.textColor,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (currentRoute != route) {
          context.go(route);
        }
      },
    );
  }
} 