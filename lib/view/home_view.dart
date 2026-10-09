import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../responsive/responsive.dart';
import '../utills/floating_profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Zain's WhatsApp number
  final String _zainPhoneNumber = "+923234248524"; 

  Future<void> _launchWhatsApp() async {
    final String cleanedNumber = _zainPhoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final String message = Uri.encodeComponent("Hello Zain! I saw your portfolio and would like to chat with you.");
    final Uri whatsappUrl = Uri.parse("https://wa.me/$cleanedNumber?text=$message");

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

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFF4F5F7),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 80.0,
        vertical: isMobile ? 30.0 : 60.0,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FloatingProfile(),
                    const SizedBox(height: 40),
                    _buildTextSection(isMobile: true),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _buildTextSection(isMobile: false),
                    ),
                    const SizedBox(width: 40),
                    const FloatingProfile(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextSection({required bool isMobile}) {
    final CrossAxisAlignment alignment =
        isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final WrapAlignment wrapAlignment =
        isMobile ? WrapAlignment.center : WrapAlignment.start;

    return Column(
      crossAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top Greeting: 👋 HI THERE!
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "👋 ",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "HI THERE!",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.0,
                color: const Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Main Name Title: I'M ZAIN
        Text(
          "I'M ZAIN",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 36 : 52,
            fontWeight: FontWeight.w900,
            height: 1.1,
            color: const Color(0xFF181818),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),

        // PROGRAMMER Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFAE34),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFAE34).withValues(alpha: 0.4),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Text(
            "PROGRAMMER",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Skill Badges / Pills: WEB DEVELOPER | UI/UX DESIGNER | SOFTWARE ENGINEER
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: wrapAlignment,
          children: [
            _buildSkillPill("WEB DEVELOPER"),
            _buildSkillPill("MOBILE DEVELOPER"),
            _buildSkillPill("UI/UX DESIGNER"),
            _buildSkillPill("API INTEGRATION"),
            _buildSkillPill("SOFTWARE ENGINEER"),
          ],
        ),
        const SizedBox(height: 32),

        // WhatsApp Me Button
        InkWell(
          onTap: _launchWhatsApp,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF43B755),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF43B755).withValues(alpha: 0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
                  child: const Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "WhatsApp Me",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Ready to handle your new project banner
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE2E4E8), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "🚀",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              Text(
                "Ready to handle your new project",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF5A5A5A),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFFFAE34),
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillPill(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D0D),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
