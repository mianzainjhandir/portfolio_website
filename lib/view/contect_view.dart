import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../responsive/responsive.dart';

class ContectView extends StatefulWidget {
  const ContectView({super.key});

  @override
  State<ContectView> createState() => _ContectViewState();
}

class _ContectViewState extends State<ContectView> {
  final String _zainPhoneNumber = "+923234248524";
  final String _zainEmail = "mianzainjhandir@gmail.com";
  final String _githubUrl = "https://github.com/mianzainjhandir";

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

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: _zainEmail,
      query: Uri.encodeFull(
          'subject=Project Inquiry&body=Hello Zain, I would like to discuss a Flutter app project.'),
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        await _launchUrl("mailto:$_zainEmail");
      }
    } catch (e) {
      debugPrint("Could not launch Email: $e");
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
              const SizedBox(height: 36),

              // Contact Information Cards Grid
              isMobile
                  ? Column(
                      children: [
                        _buildContactCard(
                          icon: Icons.chat_bubble_outline_rounded,
                          title: "WhatsApp Chat",
                          value: "+92 323 4248524",
                          buttonLabel: "Message Me",
                          onTap: _launchWhatsApp,
                          isMobile: isMobile,
                        ),
                        const SizedBox(height: 20),
                        _buildContactCard(
                          icon: Icons.email_outlined,
                          title: "Email Address",
                          value: _zainEmail,
                          buttonLabel: "Send Email",
                          onTap: _launchEmail,
                          isMobile: isMobile,
                        ),
                        const SizedBox(height: 20),
                        _buildContactCard(
                          icon: Icons.code_rounded,
                          title: "GitHub Profile",
                          value: "mianzainjhandir",
                          buttonLabel: "Visit Profile",
                          onTap: () => _launchUrl(_githubUrl),
                          isMobile: isMobile,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: _buildContactCard(
                            icon: Icons.chat_bubble_outline_rounded,
                            title: "WhatsApp Chat",
                            value: "+92 323 4248524",
                            buttonLabel: "Message Me",
                            onTap: _launchWhatsApp,
                            isMobile: isMobile,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildContactCard(
                            icon: Icons.email_outlined,
                            title: "Email Address",
                            value: _zainEmail,
                            buttonLabel: "Send Email",
                            onTap: _launchEmail,
                            isMobile: isMobile,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildContactCard(
                            icon: Icons.code_rounded,
                            title: "GitHub Profile",
                            value: "mianzainjhandir",
                            buttonLabel: "Visit Profile",
                            onTap: () => _launchUrl(_githubUrl),
                            isMobile: isMobile,
                          ),
                        ),
                      ],
                    ),

              const SizedBox(height: 50),

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

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required String buttonLabel,
    required VoidCallback onTap,
    required bool isMobile,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4E5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFFFAE34),
              size: 26,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF888888),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF181818),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFAE34),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonLabel,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
