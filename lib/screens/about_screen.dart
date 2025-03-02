import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/theme_provider.dart';
import '../widgets/common/screen_layout.dart';
import '../widgets/common/neu_button.dart';
import '../widgets/common/neu_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentRoute: '/about',
      child: AboutContent(),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({Key? key}) : super(key: key);

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
            'About Me',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: [
                  _buildProfileImage(themeProvider),
                  const SizedBox(height: 40),
                  _buildBioSection(themeProvider),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildBioSection(themeProvider),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 1,
                    child: _buildProfileImage(themeProvider),
                  ),
                ],
              ),
        const SizedBox(height: 60),
        _buildEducationSection(context, themeProvider, isMobile),
        const SizedBox(height: 60),
        _buildResumeSection(context, themeProvider),
      ],
    );
  }

  Widget _buildProfileImage(ThemeProvider themeProvider) {
    return NeuCard(
      width: 300,
      height: 300,
      borderRadius: 150,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Container(
          color: themeProvider.accentColor.withOpacity(0.1),
          child: Center(
            child: Icon(
              Icons.person,
              size: 150,
              color: themeProvider.accentColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBioSection(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who am I?',
          style: TextStyle(
            color: themeProvider.accentColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I\'m Sunil Kumar, a Flutter Developer with 6+ years of experience',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'I specialize in building high-performance, cross-platform applications using Flutter and developing native iOS applications with Swift. With a strong foundation in mobile app development, I\'ve successfully delivered over 11 cross-platform applications and 6 native iOS apps throughout my career.',
          style: TextStyle(
            color: themeProvider.textColor.withOpacity(0.8),
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'My expertise extends beyond just coding. I\'m passionate about creating intuitive user experiences and implementing modern UI/UX principles. I stay at the forefront of mobile development trends to deliver scalable, user-centric applications that drive business success.',
          style: TextStyle(
            color: themeProvider.textColor.withOpacity(0.8),
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Throughout my career, I\'ve worked with various technologies and frameworks, including Firebase, RESTful APIs, and payment gateways like Stripe. I\'m proficient in state management solutions like Provider, BLoC, and GetX, and I follow clean architecture principles to ensure maintainable and scalable codebases.',
          style: TextStyle(
            color: themeProvider.textColor.withOpacity(0.8),
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildEducationSection(
    BuildContext context,
    ThemeProvider themeProvider,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Education',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 32),
        isMobile
            ? Column(
                children: [
                  _buildEducationCard(
                    themeProvider,
                    'B.Tech (Computer Science)',
                    'Shri Ram Group of College, Muzaffarnagar',
                    '2015-2019',
                  ),
                  const SizedBox(height: 24),
                  _buildEducationCard(
                    themeProvider,
                    'Secondary School',
                    'D.A.V Inter College Muzaffarnagar',
                    '2015',
                  ),
                  const SizedBox(height: 24),
                  _buildEducationCard(
                    themeProvider,
                    'High School',
                    'J.I.C Lachhera',
                    '2013',
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: _buildEducationCard(
                      themeProvider,
                      'B.Tech (Computer Science)',
                      'Shri Ram Group of College, Muzaffarnagar',
                      '2015-2019',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildEducationCard(
                      themeProvider,
                      'Secondary School',
                      'D.A.V Inter College Muzaffarnagar',
                      '2015',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildEducationCard(
                      themeProvider,
                      'High School',
                      'J.I.C Lachhera',
                      '2013',
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildEducationCard(
    ThemeProvider themeProvider,
    String degree,
    String institution,
    String year,
  ) {
    return NeuCard(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school,
            size: 40,
            color: themeProvider.accentColor,
          ),
          const SizedBox(height: 16),
          Text(
            degree,
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            institution,
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: themeProvider.accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              year,
              style: TextStyle(
                color: themeProvider.accentColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResumeSection(BuildContext context, ThemeProvider themeProvider) {
    return NeuCard(
      color: themeProvider.accentColor.withOpacity(0.05),
      child: Column(
        children: [
          Text(
            'My Resume',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Download my resume to learn more about my experience, skills, and qualifications.',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          NeuButton(
            onPressed: () async {
              // In a real app, this would be a link to download the resume
              final url = Uri.parse('https://your-portfolio-url.com/resume.pdf');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Could not download resume. Please try again later.'),
                    ),
                  );
                }
              }
            },
            color: themeProvider.accentColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.download,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Download Resume',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 