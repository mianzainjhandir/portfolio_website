import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive/responsive.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
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
              // Section Title: About Me
              Text(
                "About Me",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF181818),
                ),
              ),
              const SizedBox(height: 24),

              // Main Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isMobile ? 20.0 : 32.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 25,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row with Avatar Icon & Title
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
                                color: const Color(0xFFFFAE34).withValues(alpha: 0.35),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ABOUT ME",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFFFFAE34),
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "I'm Zain – Flutter Developer / App Designer",
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 16 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF181818),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Description Container
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFEEEEEE),
                          width: 1.2,
                        ),
                      ),
                      child: Text(
                        "I am a passionate Flutter Developer from Pakistan, specializing in creating responsive mobile and web applications. I work with Firebase, REST APIs, Google Maps & API Key integrations, AI-powered solutions, real-time chat, authentication, and Bluetooth thermal printing solutions. My goal is to build modern and polished apps with professional user interfaces and smooth functionality.",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 13.5 : 15,
                          height: 1.6,
                          color: const Color(0xFF555555),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Skill Tags / Badges
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildTechChip(
                          icon: Icons.smartphone_rounded,
                          label: "Flutter",
                          bgColor: const Color(0xFFFFF3E0),
                          textColor: const Color(0xFFFFAE34),
                        ),
                        _buildTechChip(
                          icon: Icons.local_fire_department_rounded,
                          label: "Firebase",
                          bgColor: const Color(0xFFFFF8E1),
                          textColor: const Color(0xFFFFB300),
                        ),
                        _buildTechChip(
                          icon: Icons.code_rounded,
                          label: "REST APIs",
                          bgColor: const Color(0xFFE8F5E9),
                          textColor: const Color(0xFF4CAF50),
                        ),
                        _buildTechChip(
                          icon: Icons.map_rounded,
                          label: "Google Maps",
                          bgColor: const Color(0xFFE0F2F1),
                          textColor: const Color(0xFF00897B),
                        ),
                        _buildTechChip(
                          icon: Icons.key_rounded,
                          label: "API Keys",
                          bgColor: const Color(0xFFE1F5FE),
                          textColor: const Color(0xFF0288D1),
                        ),
                        _buildTechChip(
                          icon: Icons.auto_awesome_rounded,
                          label: "AI Master",
                          bgColor: const Color(0xFFEDE7F6),
                          textColor: const Color(0xFF5E35B1),
                        ),
                        _buildTechChip(
                          icon: Icons.brush_rounded,
                          label: "UI/UX Design",
                          bgColor: const Color(0xFFF3E5F5),
                          textColor: const Color(0xFFAB47BC),
                        ),
                        _buildTechChip(
                          icon: Icons.bluetooth_rounded,
                          label: "Bluetooth",
                          bgColor: const Color(0xFFE3F2FD),
                          textColor: const Color(0xFF2196F3),
                        ),
                        _buildTechChip(
                          icon: Icons.shield_rounded,
                          label: "Authentication",
                          bgColor: const Color(0xFFFFEBEE),
                          textColor: const Color(0xFFE57373),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Bottom Highlight Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E5),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFFFFE0B2),
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "🚀",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              "Building the future, one app at a time! 🚀",
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 13 : 14.5,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ),
                        ],
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

  Widget _buildTechChip({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: textColor,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
