import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../responsive/responsive.dart';

class ContectView extends StatefulWidget {
  const ContectView({super.key});

  @override
  State<ContectView> createState() => _ContectViewState();
}

class _ContectViewState extends State<ContectView> {
  final String _zainPhoneNumber = "+92 323 4248524";
  final String _zainEmail = "mianzainjh@gmail.com";
  final String _githubUrl = "https://github.com/mianzainjhandir";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint("Could not launch URL: $e");
    }
  }

  Future<void> _launchWhatsApp() async {
    final String cleanedNumber =
        _zainPhoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final String message = Uri.encodeComponent(
        "Hello Zain! I saw your portfolio and would like to discuss a Flutter project.");
    final Uri whatsappUrl =
        Uri.parse("https://wa.me/$cleanedNumber?text=$message");

    try {
      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(whatsappUrl, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint("Could not launch WhatsApp: $e");
    }
  }

  Future<void> _sendMessage() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final subject = _subjectController.text.trim().isEmpty
        ? "Project Inquiry from Portfolio"
        : _subjectController.text.trim();
    final message = _messageController.text.trim();

    final bodyText = "Name: $name\nEmail: $email\n\nMessage:\n$message";
    final Uri mailUri = Uri(
      scheme: 'mailto',
      path: _zainEmail,
      query: Uri.encodeFull('subject=$subject&body=$bodyText'),
    );

    try {
      if (await canLaunchUrl(mailUri)) {
        await launchUrl(mailUri);
      } else {
        await _launchWhatsApp();
      }
    } catch (e) {
      debugPrint("Error sending message: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFF4F5F7),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 80.0,
        vertical: isMobile ? 40.0 : 60.0,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row: Get In Touch
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFFAE34),
                      boxShadow: [
                        BoxShadow(
                          color:
                              const Color(0xFFFFAE34).withValues(alpha: 0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.contact_mail_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get In Touch",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF181818),
                        ),
                      ),
                      Text(
                        "Let's discuss your next Flutter project",
                        style: GoogleFonts.poppins(
                          fontSize: 13.5,
                          fontStyle: FontStyle.italic,
                          color: const Color(0xFF777777),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Main Form & Contact Info Row / Column
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMessageForm(isMobile),
                        const SizedBox(height: 50),
                        _buildContactInfoSection(isMobile),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: _buildMessageForm(isMobile),
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          flex: 5,
                          child: _buildContactInfoSection(isMobile),
                        ),
                      ],
                    ),

              const SizedBox(height: 60),

              // Bottom Footer Copyright Bar
              Center(
                child: Column(
                  children: [
                    Text(
                      "Designed & Developed with Flutter by Zain Jhandir",
                      style: GoogleFonts.poppins(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF666666),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "© ${DateTime.now().year} All Rights Reserved",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageForm(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Send me a message",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 20 : 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFAE34),
          ),
        ),
        const SizedBox(height: 20),

        _buildFormField(
          controller: _nameController,
          hintText: "Your Name",
        ),
        const SizedBox(height: 16),

        _buildFormField(
          controller: _emailController,
          hintText: "Your Email",
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        _buildFormField(
          controller: _subjectController,
          hintText: "Subject",
        ),
        const SizedBox(height: 16),

        _buildFormField(
          controller: _messageController,
          hintText: "Message",
          maxLines: 5,
        ),
        const SizedBox(height: 24),

        ElevatedButton(
          onPressed: _sendMessage,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFAE34),
            elevation: 4,
            shadowColor: const Color(0xFFFFAE34).withValues(alpha: 0.4),
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            "Send Message",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF888888), width: 1.0),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(
          fontSize: 14.5,
          color: const Color(0xFF181818),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.5,
            color: const Color(0xFFFFAE34),
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contact Information Header & List
        Text(
          "Contact Information",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 20 : 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFAE34),
          ),
        ),
        const SizedBox(height: 24),

        _buildContactInfoRow(
          icon: Icons.location_on_rounded,
          text: "Vehari, Pakistan",
          onTap: () {},
        ),
        const SizedBox(height: 20),

        _buildContactInfoRow(
          icon: Icons.phone_rounded,
          text: _zainPhoneNumber,
          onTap: _launchWhatsApp,
        ),
        const SizedBox(height: 20),

        _buildContactInfoRow(
          icon: Icons.email_rounded,
          text: _zainEmail,
          onTap: () => _launchUrl("mailto:$_zainEmail"),
        ),
        const SizedBox(height: 36),

        // Follow Me Header & Official FontAwesome Social Icons
        Text(
          "Follow Me",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 20 : 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFAE34),
          ),
        ),
        const SizedBox(height: 20),

        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildSocialIconButton(
              icon: FontAwesomeIcons.linkedin,
              tooltip: "LinkedIn",
              onTap: () => _launchUrl("https://linkedin.com"),
            ),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.github,
              tooltip: "GitHub",
              onTap: () => _launchUrl(_githubUrl),
            ),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.twitter,
              tooltip: "Twitter",
              onTap: () => _launchUrl("https://twitter.com"),
            ),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.facebook,
              tooltip: "Facebook",
              onTap: () => _launchUrl("https://facebook.com"),
            ),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.instagram,
              tooltip: "Instagram",
              onTap: () => _launchUrl("https://instagram.com"),
            ),
            _buildSocialIconButton(
              icon: FontAwesomeIcons.youtube,
              tooltip: "YouTube",
              onTap: () => _launchUrl("https://youtube.com"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactInfoRow({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFFFFAE34),
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFAE34),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIconButton({
    required dynamic icon,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon as IconData,
            color: const Color(0xFFFFAE34),
            size: 22,
          ),
        ),
      ),
    );
  }
}
