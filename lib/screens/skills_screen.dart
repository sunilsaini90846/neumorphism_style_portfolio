import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/common/screen_layout.dart';
import '../widgets/common/neu_card.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentRoute: '/skills',
      child: SkillsContent(),
    );
  }
}

class SkillsContent extends StatelessWidget {
  const SkillsContent({Key? key}) : super(key: key);

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
            'My Skills',
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
            'Technical expertise and competencies',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        
        // Mobile Development Section
        _buildSkillSection(
          context,
          themeProvider,
          'Mobile Development',
          Icons.phone_android,
          [
            'Flutter Framework',
            'Dart Programming',
            'iOS Development',
            'Swift',
            'Android Development',
            'Cross-Platform Apps',
            'Responsive Design',
          ],
          isMobile,
        ),
        const SizedBox(height: 40),
        
        // State Management Section
        _buildSkillSection(
          context,
          themeProvider,
          'State Management',
          Icons.architecture,
          [
            'Provider',
            'Flutter Bloc',
            'GetX',
            'Clean Architecture',
            'MVC Pattern',
            'MVVM Pattern',
            'SOLID Principles',
          ],
          isMobile,
        ),
        const SizedBox(height: 40),
        
        // Backend & Services Section
        _buildSkillSection(
          context,
          themeProvider,
          'Backend & Services',
          Icons.cloud,
          [
            'Firebase Integration',
            'RESTful APIs',
            'Stripe Payment',
            'Apple Pay',
            'Google Pay',
            'Push Notifications',
            'Web Services',
          ],
          isMobile,
        ),
        const SizedBox(height: 40),
        
        // Tools & Platforms Section
        _buildSkillSection(
          context,
          themeProvider,
          'Tools & Platforms',
          Icons.build,
          [
            'Git & Version Control',
            'Bitbucket',
            'GitLab',
            'Postman',
            'Android Studio',
            'Visual Studio Code',
            'Xcode',
          ],
          isMobile,
        ),
        const SizedBox(height: 40),
        
        // Additional Skills Section
        _buildSkillSection(
          context,
          themeProvider,
          'Additional Skills',
          Icons.add_circle,
          [
            'UI/UX Design',
            'Material Design',
            'App Performance Optimization',
            'Code Refactoring',
            'Multi-Language Support',
            'Multi-Theme Support',
            'App Store & Play Store Submission',
          ],
          isMobile,
        ),
        const SizedBox(height: 40),
        
        // Proficiency Levels
        _buildProficiencySection(context, themeProvider, isMobile),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildSkillSection(
    BuildContext context,
    ThemeProvider themeProvider,
    String title,
    IconData icon,
    List<String> skills,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: themeProvider.accentColor,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: themeProvider.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        isMobile
            ? Column(
                children: skills
                    .map((skill) => _buildSkillCard(themeProvider, skill))
                    .toList(),
              )
            : Wrap(
                spacing: 16,
                runSpacing: 16,
                children: skills
                    .map((skill) => _buildSkillCard(themeProvider, skill))
                    .toList(),
              ),
      ],
    );
  }

  Widget _buildSkillCard(ThemeProvider themeProvider, String skill) {
    return NeuCard(
      width: 200,
      height: 60,
      borderRadius: 30,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(
          skill,
          style: TextStyle(
            color: themeProvider.textColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildProficiencySection(
    BuildContext context,
    ThemeProvider themeProvider,
    bool isMobile,
  ) {
    final proficiencies = [
      {
        'name': 'Flutter & Dart',
        'level': 0.95,
      },
      {
        'name': 'iOS & Swift',
        'level': 0.85,
      },
      {
        'name': 'Firebase',
        'level': 0.90,
      },
      {
        'name': 'RESTful APIs',
        'level': 0.88,
      },
      {
        'name': 'UI/UX Design',
        'level': 0.82,
      },
      {
        'name': 'State Management',
        'level': 0.92,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Proficiency Levels',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ...proficiencies.map((proficiency) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildProficiencyBar(
                themeProvider,
                proficiency['name'] as String,
                proficiency['level'] as double,
              ),
            )),
      ],
    );
  }

  Widget _buildProficiencyBar(
    ThemeProvider themeProvider,
    String name,
    double level,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                color: themeProvider.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${(level * 100).toInt()}%',
              style: TextStyle(
                color: themeProvider.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 16,
              width: double.infinity,
              decoration: themeProvider.getNeumorphicInnerDecoration(
                borderRadius: 8,
              ),
            ),
            FractionallySizedBox(
              widthFactor: level,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: themeProvider.accentColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
} 