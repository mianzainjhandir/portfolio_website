import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive/responsive.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFF4F5F7), // Light grey background
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
              // Header Row: Skills & Experience
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
                      Icons.auto_awesome_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skills & Experience",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF181818),
                        ),
                      ),
                      Text(
                        "Where Talent Meets Technology",
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

              // Main Skills Card
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
                    Text(
                      "Technical Proficiency",
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF181818),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Skill Bars
                    isMobile
                        ? Column(
                            children: [
                              _buildSkillProgress("Flutter & Dart", 0.95),
                              _buildSkillProgress("Firebase & Backend", 0.90),
                              _buildSkillProgress("REST APIs & JSON", 0.92),
                              _buildSkillProgress("Google Maps & Location", 0.88),
                              _buildSkillProgress("UI/UX & Responsive Design", 0.92),
                              _buildSkillProgress("AI Models Integration", 0.85),
                              _buildSkillProgress("Bluetooth & POS Printing", 0.85),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildSkillProgress("Flutter & Dart", 0.95),
                                    _buildSkillProgress("Firebase & Backend", 0.90),
                                    _buildSkillProgress("REST APIs & JSON", 0.92),
                                    _buildSkillProgress("Google Maps & Location", 0.88),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 40),
                              Expanded(
                                child: Column(
                                  children: [
                                    _buildSkillProgress("UI/UX & Responsive Design", 0.92),
                                    _buildSkillProgress("AI Models Integration", 0.85),
                                    _buildSkillProgress("Bluetooth & POS Printing", 0.85),
                                    _buildSkillProgress("State Management (GetX/Provider)", 0.90),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Experience Section Card
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
                    Row(
                      children: [
                        const Icon(
                          Icons.history_edu_rounded,
                          color: Color(0xFFFFAE34),
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Work Experience",
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 18 : 22,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF181818),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _buildExperienceItem(
                      role: "Senior Flutter Developer",
                      company: "Freelance & Client Projects",
                      duration: "2023 - Present (2+ Years)",
                      description:
                          "Architecting and delivering high-performance cross-platform Flutter applications. Implemented Firebase backends, Google Maps live tracking, RESTful APIs, AI-powered features, and Bluetooth thermal printer hardware integrations.",
                      isMobile: isMobile,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
                    ),
                    _buildExperienceItem(
                      role: "Mobile App Developer / UI Designer",
                      company: "Software Solutions",
                      duration: "2022 - 2023",
                      description:
                          "Designed and developed sleek mobile interfaces with pixel-perfect responsiveness. Specialized in API integrations, state management, and real-time database synchronizations.",
                      isMobile: isMobile,
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

  Widget _buildSkillProgress(String name, double level) {
    final int percentage = (level * 100).toInt();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF222222),
                ),
              ),
              Text(
                "$percentage%",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFFAE34),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: level,
              minHeight: 8,
              backgroundColor: const Color(0xFFEEEEEE),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFAE34)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String role,
    required String company,
    required String duration,
    required String description,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 16 : 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF181818),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    company,
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFAE34),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4E5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                duration,
                style: GoogleFonts.poppins(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFFAE34),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: 14,
            height: 1.5,
            color: const Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
