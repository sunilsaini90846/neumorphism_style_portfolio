import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/theme_provider.dart';
import 'neu_button.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      color: themeProvider.backgroundColor,
      child: Column(
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildContactInfo(themeProvider),
                    const SizedBox(height: 32),
                    _buildSocialLinks(themeProvider),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(themeProvider),
                    _buildSocialLinks(themeProvider),
                  ],
                ),
          const SizedBox(height: 40),
          Divider(
            color: themeProvider.textColor.withOpacity(0.1),
            thickness: 1,
          ),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} Sunil Kumar. All rights reserved.',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sunil Kumar',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          themeProvider,
          Icons.email_outlined,
          'sunilsaini90846@gmail.com',
          'mailto:sunilsaini90846@gmail.com',
        ),
        const SizedBox(height: 8),
        _buildContactItem(
          themeProvider,
          Icons.phone_outlined,
          '+919084614505',
          'tel:+919084614505',
        ),
        const SizedBox(height: 8),
        _buildContactItem(
          themeProvider,
          Icons.location_on_outlined,
          'Muzaffarnagar, Uttar Pradesh, India',
          null,
        ),
      ],
    );
  }

  Widget _buildContactItem(
    ThemeProvider themeProvider,
    IconData icon,
    String text,
    String? url,
  ) {
    return InkWell(
      onTap: url != null
          ? () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            }
          : null,
      child: Row(
        children: [
          Icon(
            icon,
            color: themeProvider.accentColor,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Connect with me',
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialButton(
              themeProvider,
              Icons.link,
              'LinkedIn',
              'https://linkedin.com/in/sunilsainideveloper',
            ),
            const SizedBox(width: 16),
            _buildSocialButton(
              themeProvider,
              Icons.code,
              'GitHub',
              'https://github.com/sunilsaini',
            ),
            const SizedBox(width: 16),
            _buildSocialButton(
              themeProvider,
              Icons.mail,
              'Email',
              'mailto:sunilsaini90846@gmail.com',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    ThemeProvider themeProvider,
    IconData icon,
    String label,
    String url,
  ) {
    return NeuButton(
      width: 50,
      height: 50,
      padding: EdgeInsets.zero,
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Icon(
        icon,
        color: themeProvider.accentColor,
      ),
    );
  }
} 