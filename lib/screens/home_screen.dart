import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/common/screen_layout.dart';
import '../widgets/common/neu_button.dart';
import '../widgets/common/neu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentRoute: '/',
      child: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      children: [
        isMobile
            ? _buildMobileHeroSection(context, themeProvider)
            : _buildDesktopHeroSection(context, themeProvider),
        const SizedBox(height: 80),
        _buildFeaturedSection(context, themeProvider, isMobile),
        const SizedBox(height: 80),
        _buildCallToAction(context, themeProvider),
      ],
    );
  }

  Widget _buildDesktopHeroSection(BuildContext context, ThemeProvider themeProvider) {
    return SizedBox(
      height: 600,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, I\'m',
                  style: TextStyle(
                    color: themeProvider.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sunil Kumar',
                  style: TextStyle(
                    color: themeProvider.textColor,
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        textStyle: TextStyle(
                          color: themeProvider.accentColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Mobile App Developer',
                        textStyle: TextStyle(
                          color: themeProvider.accentColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'UI/UX Enthusiast',
                        textStyle: TextStyle(
                          color: themeProvider.accentColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 3,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'With 6+ years of experience in Flutter and iOS development, I create high-performance, cross-platform applications with modern UI/UX principles.',
                  style: TextStyle(
                    color: themeProvider.textColor.withOpacity(0.8),
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    NeuButton(
                      onPressed: () {
                        context.go('/contact');
                      },
                      child: Text(
                        'Contact Me',
                        style: TextStyle(
                          color: themeProvider.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    NeuButton(
                      onPressed: () {
                        context.go('/projects');
                      },
                      color: themeProvider.accentColor,
                      child: const Text(
                        'View Projects',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Center(
              child: NeuCard(
                width: 400,
                height: 400,
                borderRadius: 200,
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    color: themeProvider.accentColor.withOpacity(0.1),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 200,
                        color: themeProvider.accentColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileHeroSection(BuildContext context, ThemeProvider themeProvider) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Center(
          child: NeuCard(
            width: 200,
            height: 200,
            borderRadius: 100,
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                color: themeProvider.accentColor.withOpacity(0.1),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: themeProvider.accentColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Hello, I\'m',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Sunil Kumar',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                textStyle: TextStyle(
                  color: themeProvider.accentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Mobile App Developer',
                textStyle: TextStyle(
                  color: themeProvider.accentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'UI/UX Enthusiast',
                textStyle: TextStyle(
                  color: themeProvider.accentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 3,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'With 6+ years of experience in Flutter and iOS development, I create high-performance, cross-platform applications with modern UI/UX principles.',
          style: TextStyle(
            color: themeProvider.textColor.withOpacity(0.8),
            fontSize: 16,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            NeuButton(
              width: 200,
              onPressed: () {
                context.go('/contact');
              },
              child: Text(
                'Contact Me',
                style: TextStyle(
                  color: themeProvider.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            NeuButton(
              width: 200,
              onPressed: () {
                context.go('/projects');
              },
              color: themeProvider.accentColor,
              child: const Text(
                'View Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedSection(BuildContext context, ThemeProvider themeProvider, bool isMobile) {
    return Column(
      children: [
        Text(
          'What I Do',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Specialized in creating modern, responsive applications',
          style: TextStyle(
            color: themeProvider.textColor.withOpacity(0.8),
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: [
                  _buildFeatureCard(
                    themeProvider,
                    Icons.phone_android,
                    'Mobile Development',
                    'Building cross-platform mobile applications using Flutter and native iOS apps with Swift.',
                  ),
                  const SizedBox(height: 24),
                  _buildFeatureCard(
                    themeProvider,
                    Icons.web,
                    'Web Development',
                    'Creating responsive web applications with Flutter Web for a consistent experience across platforms.',
                  ),
                  const SizedBox(height: 24),
                  _buildFeatureCard(
                    themeProvider,
                    Icons.design_services,
                    'UI/UX Design',
                    'Designing intuitive user interfaces with modern design principles and smooth user experiences.',
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: _buildFeatureCard(
                      themeProvider,
                      Icons.phone_android,
                      'Mobile Development',
                      'Building cross-platform mobile applications using Flutter and native iOS apps with Swift.',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildFeatureCard(
                      themeProvider,
                      Icons.web,
                      'Web Development',
                      'Creating responsive web applications with Flutter Web for a consistent experience across platforms.',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _buildFeatureCard(
                      themeProvider,
                      Icons.design_services,
                      'UI/UX Design',
                      'Designing intuitive user interfaces with modern design principles and smooth user experiences.',
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildFeatureCard(
    ThemeProvider themeProvider,
    IconData icon,
    String title,
    String description,
  ) {
    return NeuCard(
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: themeProvider.accentColor,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 14,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context, ThemeProvider themeProvider) {
    return NeuCard(
      color: themeProvider.accentColor.withOpacity(0.1),
      child: Column(
        children: [
          Text(
            'Let\'s Work Together',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Have a project in mind? Let\'s discuss how I can help bring your ideas to life.',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          NeuButton(
            onPressed: () {
              context.go('/contact');
            },
            color: themeProvider.accentColor,
            child: const Text(
              'Get In Touch',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 