import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/skills_screen.dart';
import '../screens/projects_screen.dart';
import '../screens/experience_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/blog_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/skills',
      name: 'skills',
      builder: (context, state) => const SkillsScreen(),
    ),
    GoRoute(
      path: '/projects',
      name: 'projects',
      builder: (context, state) => const ProjectsScreen(),
    ),
    GoRoute(
      path: '/experience',
      name: 'experience',
      builder: (context, state) => const ExperienceScreen(),
    ),
    GoRoute(
      path: '/contact',
      name: 'contact',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/blog',
      name: 'blog',
      builder: (context, state) => const BlogScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(
        'Page not found: ${state.uri.path}',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ),
  ),
); 