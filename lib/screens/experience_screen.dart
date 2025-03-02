import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import '../providers/theme_provider.dart';
import '../widgets/common/screen_layout.dart';
import '../widgets/common/neu_card.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentRoute: '/experience',
      child: ExperienceContent(),
    );
  }
}

class ExperienceContent extends StatelessWidget {
  const ExperienceContent({Key? key}) : super(key: key);

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
            'Work Experience',
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
            'My professional journey and career growth',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 60),
        
        // Experience Timeline
        isMobile
            ? _buildMobileTimeline(context, themeProvider)
            : _buildDesktopTimeline(context, themeProvider),
        
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildMobileTimeline(BuildContext context, ThemeProvider themeProvider) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.vertical,
        connectorTheme: ConnectorThemeData(
          thickness: 3.0,
          color: themeProvider.accentColor,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: _getExperiences().length,
        contentsBuilder: (_, index) {
          final experience = _getExperiences()[index];
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 40.0),
            child: _buildExperienceCard(context, themeProvider, experience),
          );
        },
        indicatorBuilder: (_, index) {
          return DotIndicator(
            size: 20,
            color: themeProvider.accentColor,
            child: Icon(
              Icons.work,
              size: 12,
              color: Colors.white,
            ),
          );
        },
        connectorBuilder: (_, index, connectorType) {
          return SolidLineConnector(
            color: themeProvider.accentColor,
          );
        },
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildDesktopTimeline(BuildContext context, ThemeProvider themeProvider) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.vertical,
        connectorTheme: ConnectorThemeData(
          thickness: 3.0,
          color: themeProvider.accentColor,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: _getExperiences().length,
        contentsBuilder: (_, index) {
          final experience = _getExperiences()[index];
          return Padding(
            padding: const EdgeInsets.only(left: 24.0, bottom: 60.0),
            child: _buildExperienceCard(context, themeProvider, experience, isDesktop: true),
          );
        },
        indicatorBuilder: (_, index) {
          return DotIndicator(
            size: 30,
            color: themeProvider.accentColor,
            child: Icon(
              Icons.work,
              size: 16,
              color: Colors.white,
            ),
          );
        },
        connectorBuilder: (_, index, connectorType) {
          return SolidLineConnector(
            color: themeProvider.accentColor,
          );
        },
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    ThemeProvider themeProvider,
    Map<String, dynamic> experience, {
    bool isDesktop = false,
  }) {
    return NeuCard(
      width: isDesktop ? 700 : double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience['position'],
                      style: TextStyle(
                        color: themeProvider.textColor,
                        fontSize: isDesktop ? 22 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      experience['company'],
                      style: TextStyle(
                        color: themeProvider.accentColor,
                        fontSize: isDesktop ? 18 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: themeProvider.accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  experience['period'],
                  style: TextStyle(
                    color: themeProvider.accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(
            (experience['responsibilities'] as List<String>).length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: themeProvider.accentColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      experience['responsibilities'][index],
                      style: TextStyle(
                        color: themeProvider.textColor.withOpacity(0.8),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (experience['skills'] as List<String>).map((skill) => Container(
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
                skill,
                style: TextStyle(
                  color: themeProvider.textColor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getExperiences() {
    return [
      {
        'company': 'Spire Innovations, Inc',
        'position': 'Senior Software Engineer (Flutter)',
        'period': 'October 2023 - March 2024',
        'responsibilities': [
          'Led the development of cross-platform mobile applications using Flutter.',
          'Collaborated with backend teams working with Spring Boot and Django Rest Framework.',
          'Implemented Microsoft Intune for enterprise app management and security.',
        ],
        'skills': ['Flutter', 'Dart', 'Spring Boot', 'Python', 'Django Rest Framework', 'Microsoft Intune'],
      },
      {
        'company': 'Techahead',
        'position': 'Senior Software Engineer',
        'period': 'October 2023 - March 2024',
        'responsibilities': [
          'Developed a cross-platform app from scratch using Flutter.',
          'Conducted thorough team code reviews to ensure code quality and best practices.',
          'Worked on a live app for code refactoring and hiding sensitive data.',
          'Changed project architecture and upgraded Flutter and dependencies.',
          'Developed Flutter web sites with responsive design.',
        ],
        'skills': ['Dart', 'Flutter', 'Postman', 'Flutter Web', 'Code Refactoring', 'Architecture Design'],
      },
      {
        'company': 'Ficode Software Solutions Private Limited',
        'position': 'Software Engineer (Flutter & iOS)',
        'period': 'March 2019 - September 2023',
        'responsibilities': [
          'Developed 8 high-performing mobile apps using the Flutter framework.',
          'Created 3 native iPhone and iPad apps using Swift.',
          'Upgraded legacy projects to the latest Flutter versions.',
          'Excelled in complex problem-solving scenarios.',
          'Proficiently managed project documentation and analysis.',
          'Recognized as the "Employee of the Month" for outstanding contributions.',
          'Actively engaged in Low-Level Design (LLD) and High Level Design (HLD).',
        ],
        'skills': ['Flutter', 'iOS', 'Swift', 'Firebase', 'REST APIs', 'UI/UX Design', 'System Architecture'],
      },
    ];
  }
} 