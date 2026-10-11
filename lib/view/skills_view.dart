import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../responsive/responsive.dart';

class SkillsView extends StatelessWidget {
  final bool isVisible;
  final bool isDarkMode;

  const SkillsView({
    super.key,
    this.isVisible = true,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isDark = isDarkMode;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF222226) : const Color(0xFFF4F5F7),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
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
                          color: isDark ? Colors.white : const Color(0xFF181818),
                        ),
                      ),
                      Text(
                        "Where Talent Meets Technology",
                        style: GoogleFonts.poppins(
                          fontSize: 13.5,
                          fontStyle: FontStyle.italic,
                          color: isDark ? Colors.white70 : const Color(0xFF777777),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 36),

              // Two Columns Layout (Education Journey & Personal Skills + Technical Skills)
              isMobile
                  ? Column(
                      children: [
                        _buildEducationJourney(isMobile, isDark),
                        const SizedBox(height: 40),
                        _buildPersonalSkills(isMobile, isDark),
                        const SizedBox(height: 40),
                        _buildTechnicalSkills(isMobile, isDark),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: _buildEducationJourney(isMobile, isDark),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              _buildPersonalSkills(isMobile, isDark),
                              const SizedBox(height: 40),
                              _buildTechnicalSkills(isMobile, isDark),
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationJourney(bool isMobile, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Education Header Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
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
                Icons.school_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Education Journey",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF181818),
                  ),
                ),
                Text(
                  "My Learning Path",
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    fontStyle: FontStyle.italic,
                    color: isDark ? Colors.white70 : const Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Timeline Items
        _buildTimelineItem(
          title: "BS Software Engineering",
          subtitle: "Virtual University of Pakistan (Ongoing)",
          dateTag: "Present",
          description:
              "Focusing on core software engineering principles, computer science fundamentals, data structures, and modern software development practices.",
          isLast: false,
          isDark: isDark,
        ),
        _buildTimelineItem(
          title: "Flutter Learning Journey",
          subtitle: "AiLab Solutions",
          dateTag: "Late 2023 - Present",
          description:
              "Began learning Flutter in late 2023 at AiLab Solutions. Gained proficiency in Dart, UI/UX design, and building cross-platform mobile applications.",
          isLast: false,
          isDark: isDark,
        ),
        _buildTimelineItem(
          title: "Advanced Flutter Concepts",
          subtitle: "Continuous Learning",
          dateTag: "Ongoing",
          description:
              "Continuously learning advanced Flutter topics including state management, animations, and performance optimization.",
          isLast: true,
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String dateTag,
    required String description,
    required bool isLast,
    required bool isDark,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line & Dot Column
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFAE34),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: isDark ? const Color(0xFF383842) : const Color(0xFFE0E0E0),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),

          // Content Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF181818),
                          ),
                        ),
                      ),
                      Text(
                        dateTag,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFAE34),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : const Color(0xFF888888),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      height: 1.5,
                      color: isDark ? Colors.white60 : const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalSkills(bool isMobile, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Personal Skills Header Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2196F3),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2196F3).withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Skills",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF181818),
                  ),
                ),
                Text(
                  "Soft Skills & Attributes",
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    fontStyle: FontStyle.italic,
                    color: isDark ? Colors.white70 : const Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 28),

        // White Card Container for Soft Skills
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 20.0 : 28.0),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF28282E) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSoftSkillProgress("Time Management", 0.90, isDark),
              _buildSoftSkillProgress("Adaptability", 0.88, isDark),
              _buildSoftSkillProgress("Teamwork", 0.92, isDark),
              _buildSoftSkillProgress("Communication", 0.85, isDark),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTechnicalSkills(bool isMobile, bool isDark) {
    final techSkills = [
      {
        "label": "Flutter",
        "percentage": "85%",
        "progress": 0.85,
        "color": const Color(0xFF0288D1),
      },
      {
        "label": "Dart",
        "percentage": "90%",
        "progress": 0.90,
        "color": const Color(0xFF009688),
      },
      {
        "label": "Firebase",
        "percentage": "75%",
        "progress": 0.75,
        "color": const Color(0xFFFF5722),
      },
      {
        "label": "REST APIs",
        "percentage": "80%",
        "progress": 0.80,
        "color": const Color(0xFFAB47BC),
      },
      {
        "label": "Git",
        "percentage": "88%",
        "progress": 0.88,
        "color": const Color(0xFF607D8B),
      },
      {
        "label": "UI/UX",
        "percentage": "70%",
        "progress": 0.70,
        "color": const Color(0xFFC0CA33),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Technical Skills Header Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF4CAF50),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4CAF50).withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.code_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Technical Skills",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF181818),
                  ),
                ),
                Text(
                  "Programming & Tools",
                  style: GoogleFonts.poppins(
                    fontSize: 12.5,
                    fontStyle: FontStyle.italic,
                    color: isDark ? Colors.white70 : const Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 28),

        // White Card Container for Technical Skills Circles
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 20.0 : 28.0),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF28282E) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Wrap(
            spacing: isMobile ? 20 : 32,
            runSpacing: 28,
            alignment: WrapAlignment.spaceAround,
            children: techSkills.map((s) {
              return _buildCircularProgressSkill(
                label: s["label"] as String,
                percentageText: s["percentage"] as String,
                progress: s["progress"] as double,
                color: s["color"] as Color,
                isDark: isDark,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCircularProgressSkill({
    required String label,
    required String percentageText,
    required double progress,
    required Color color,
    required bool isDark,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 0.0,
        end: isVisible ? progress : 0.0,
      ),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOutCubic,
      builder: (context, animatedValue, child) {
        final int currentPercentage = (animatedValue * 100).toInt();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 72,
              height: 72,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 72,
                    height: 72,
                    child: CircularProgressIndicator(
                      value: animatedValue,
                      strokeWidth: 7,
                      backgroundColor: isDark ? const Color(0xFF383842) : const Color(0xFFEEEEEE),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Text(
                    "$currentPercentage%",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: isDark ? const Color(0xFF81C784) : const Color(0xFF2E7D32),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : const Color(0xFF333333),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSoftSkillProgress(String name, double progress, bool isDark) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 0.0,
        end: isVisible ? progress : 0.0,
      ),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOutCubic,
      builder: (context, animatedValue, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: animatedValue,
                  minHeight: 8,
                  backgroundColor: isDark ? const Color(0xFF383842) : const Color(0xFFECEFF1),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
