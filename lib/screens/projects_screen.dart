import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../providers/theme_provider.dart';
import '../widgets/common/screen_layout.dart';
import '../widgets/common/neu_card.dart';
import '../widgets/common/neu_button.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentRoute: '/projects',
      child: ProjectsContent(),
    );
  }
}

class ProjectsContent extends StatelessWidget {
  const ProjectsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'My Projects',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'A showcase of my recent work and contributions',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        
        // Project Categories
        _buildCategoryFilter(context, themeProvider),
        const SizedBox(height: 40),
        
        // Projects Grid
        isMobile
            ? _buildMobileProjectsGrid(context, themeProvider)
            : _buildDesktopProjectsGrid(context, themeProvider),
        
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildCategoryFilter(BuildContext context, ThemeProvider themeProvider) {
    final categories = ['All', 'Mobile Apps', 'Web Apps', 'UI/UX', 'IoT'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == 'All';
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: NeuCard(
              width: 120,
              height: 40,
              borderRadius: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: isSelected ? themeProvider.accentColor : null,
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : themeProvider.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMobileProjectsGrid(BuildContext context, ThemeProvider themeProvider) {
    return Column(
      children: _getProjects().map((project) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: _buildProjectCard(context, themeProvider, project),
      )).toList(),
    );
  }

  Widget _buildDesktopProjectsGrid(BuildContext context, ThemeProvider themeProvider) {
    return MasonryGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _getProjects().length,
      itemBuilder: (context, index) {
        return _buildProjectCard(
          context, 
          themeProvider, 
          _getProjects()[index],
        );
      },
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    ThemeProvider themeProvider,
    Map<String, dynamic> project,
  ) {
    return NeuCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 200,
              width: double.infinity,
              color: themeProvider.accentColor.withOpacity(0.1),
              child: Center(
                child: Icon(
                  _getIconForCategory(project['category']),
                  size: 80,
                  color: themeProvider.accentColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Project Title
          Text(
            project['title'],
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          
          // Project Category
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: themeProvider.accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              project['category'],
              style: TextStyle(
                color: themeProvider.accentColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          // Project Description
          Text(
            project['description'],
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          
          // Technologies Used
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (project['technologies'] as List<String>).map((tech) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: themeProvider.backgroundColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: themeProvider.shadowColor.withOpacity(0.3),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: themeProvider.highlightColor.withOpacity(0.3),
                    offset: const Offset(-2, -2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Text(
                tech,
                style: TextStyle(
                  color: themeProvider.textColor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            )).toList(),
          ),
          const SizedBox(height: 16),
          
          // View Project Button
          NeuButton(
            width: double.infinity,
            onPressed: () {
              // In a real app, this would navigate to a detailed project page
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Viewing details for ${project['title']}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: Text(
              'View Project',
              style: TextStyle(
                color: themeProvider.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Mobile App':
        return Icons.phone_android;
      case 'Web App':
        return Icons.web;
      case 'UI/UX':
        return Icons.design_services;
      case 'IoT':
        return Icons.devices_other;
      default:
        return Icons.code;
    }
  }

  List<Map<String, dynamic>> _getProjects() {
    return [
      {
        'title': 'Bubll - IoT Mobile App',
        'category': 'Mobile App',
        'description': 'A comprehensive IoT-based mobile application that allows users to control and monitor smart home devices from their smartphones.',
        'technologies': ['Flutter', 'Firebase', 'IoT', 'BLoC'],
      },
      {
        'title': 'IBOS - Business Management',
        'category': 'Mobile App',
        'description': 'An integrated business operations system that streamlines workflow, inventory management, and customer relations for small to medium businesses.',
        'technologies': ['Flutter', 'REST API', 'Provider', 'SQLite'],
      },
      {
        'title': 'Workman - Task Management',
        'category': 'Mobile App',
        'description': 'A task management application designed for teams to collaborate, assign tasks, track progress, and manage deadlines efficiently.',
        'technologies': ['Flutter', 'Firebase', 'GetX', 'Cloud Functions'],
      },
      {
        'title': 'E-Commerce Platform',
        'category': 'Web App',
        'description': 'A full-featured e-commerce platform with product catalog, shopping cart, payment integration, and order management system.',
        'technologies': ['Flutter Web', 'Firebase', 'Stripe', 'Provider'],
      },
      {
        'title': 'Health & Fitness Tracker',
        'category': 'Mobile App',
        'description': 'A health and fitness application that tracks workouts, nutrition, and provides personalized recommendations based on user goals.',
        'technologies': ['Flutter', 'HealthKit', 'Google Fit', 'BLoC'],
      },
      {
        'title': 'Smart Home Dashboard',
        'category': 'IoT',
        'description': 'A centralized dashboard for monitoring and controlling various smart home devices, with automation capabilities and usage analytics.',
        'technologies': ['Flutter', 'MQTT', 'WebSockets', 'Charts'],
      },
    ];
  }
} 