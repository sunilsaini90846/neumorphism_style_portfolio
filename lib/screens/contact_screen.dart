import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/common/screen_layout.dart';
import '../widgets/common/neu_button.dart';
import '../widgets/common/neu_card.dart';
import '../widgets/common/neu_text_field.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentRoute: '/contact',
      child: ContactContent(),
    );
  }
}

class ContactContent extends StatefulWidget {
  const ContactContent({super.key});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulate form submission
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
          _showSuccessDialog();
          _resetForm();
        }
      });
    }
  }

  void _resetForm() {
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
    _formKey.currentState?.reset();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Message Sent'),
        content: const Text(
          'Thank you for your message! I will get back to you as soon as possible.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      children: [
        Center(
          child: Text(
            'Get In Touch',
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
            'Have a question or want to work together? Feel free to contact me!',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 60),
        isMobile
            ? Column(
                children: [
                  _buildContactForm(themeProvider),
                  const SizedBox(height: 40),
                  _buildContactInfo(themeProvider),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildContactForm(themeProvider),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 2,
                    child: _buildContactInfo(themeProvider),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildContactForm(ThemeProvider themeProvider) {
    return NeuCard(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Message',
              style: TextStyle(
                color: themeProvider.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            NeuTextField(
              hintText: 'Your Name',
              controller: _nameController,
              prefixIcon: Icon(
                Icons.person_outline,
                color: themeProvider.textColor.withOpacity(0.7),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            NeuTextField(
              hintText: 'Your Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: themeProvider.textColor.withOpacity(0.7),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            NeuTextField(
              hintText: 'Subject',
              controller: _subjectController,
              prefixIcon: Icon(
                Icons.subject,
                color: themeProvider.textColor.withOpacity(0.7),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            NeuTextField(
              hintText: 'Your Message',
              controller: _messageController,
              maxLines: 5,
              prefixIcon: Icon(
                Icons.message_outlined,
                color: themeProvider.textColor.withOpacity(0.7),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: _isSubmitting
                  ? CircularProgressIndicator(
                      color: themeProvider.accentColor,
                    )
                  : NeuButton(
                      onPressed: _submitForm,
                      color: themeProvider.accentColor,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Send Message',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(ThemeProvider themeProvider) {
    return NeuCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _buildContactItem(
            themeProvider,
            Icons.email_outlined,
            'Email',
            'sunilsaini90846@gmail.com',
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            themeProvider,
            Icons.phone_outlined,
            'Phone',
            '+919084614505',
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            themeProvider,
            Icons.location_on_outlined,
            'Location',
            'Muzaffarnagar, Uttar Pradesh, India',
          ),
          const SizedBox(height: 32),
          Text(
            'Social Media',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocialButton(
                themeProvider,
                Icons.link,
                'LinkedIn',
              ),
              _buildSocialButton(
                themeProvider,
                Icons.code,
                'GitHub',
              ),
              _buildSocialButton(
                themeProvider,
                Icons.web,
                'Website',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    ThemeProvider themeProvider,
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: themeProvider.accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: themeProvider.accentColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: themeProvider.textColor.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  color: themeProvider.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    ThemeProvider themeProvider,
    IconData icon,
    String label,
  ) {
    return Column(
      children: [
        NeuButton(
          width: 50,
          height: 50,
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(
            icon,
            color: themeProvider.accentColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: themeProvider.textColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
} 