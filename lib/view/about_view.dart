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
      decoration: const BoxDecoration(
        color: Colors.white,
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

              const SizedBox(height: 50),

              // My Services Section
              _buildServicesSection(isMobile),

              const SizedBox(height: 50),

              // Achievements & Stats Section
              _buildAchievementsSection(isMobile),

              const SizedBox(height: 50),

              // Ready to Start Your Project Callout
              _buildProjectCalloutCard(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCalloutCard(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20.0 : 28.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFE0B2),
          width: 1.2,
        ),
      ),
      child: Row(
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
              Icons.rocket_launch_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ready to Start Your Project?",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF181818),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Let's collaborate and bring your ideas to life with cutting-edge Flutter solutions",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 13 : 14,
                    color: const Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(bool isMobile) {
    final stats = [
      {
        "icon": Icons.access_time_rounded,
        "value": "2+",
        "label": "Years\nExperience",
      },
      {
        "icon": Icons.playlist_add_check_rounded,
        "value": "6+",
        "label": "Projects\nCompleted",
      },
      {
        "icon": Icons.star_rounded,
        "value": "100%",
        "label": "Client\nSatisfaction",
      },
      {
        "icon": Icons.code_rounded,
        "value": "10k+",
        "label": "Lines of\nFlutter Code",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
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
                Icons.trending_up_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Achievements & Stats",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF181818),
                  ),
                ),
                Text(
                  "Numbers That Tell My Story",
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
        const SizedBox(height: 28),

        // Stats Card Container
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 32.0,
            vertical: isMobile ? 28.0 : 36.0,
          ),
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
          child: isMobile
              ? Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: stats
                      .map((s) => _buildStatCircle(
                            icon: s["icon"] as IconData,
                            value: s["value"] as String,
                            label: s["label"] as String,
                            isMobile: true,
                          ))
                      .toList(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: stats
                      .map((s) => _buildStatCircle(
                            icon: s["icon"] as IconData,
                            value: s["value"] as String,
                            label: s["label"] as String,
                            isMobile: false,
                          ))
                      .toList(),
                ),
        ),
      ],
    );
  }

  Widget _buildStatCircle({
    required IconData icon,
    required String value,
    required String label,
    required bool isMobile,
  }) {
    final double circleSize = isMobile ? 125 : 145;

    return Container(
      width: circleSize,
      height: circleSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF0D0D0D),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isMobile ? 20 : 22,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 10 : 11,
              height: 1.2,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(bool isMobile) {
    final services = [
      {
        "icon": Icons.smartphone_rounded,
        "title": "Flutter Development",
        "description":
            "Building high-performance cross-platform apps for Android, iOS, and Web with modern Flutter architecture.",
      },
      {
        "icon": Icons.cloud_rounded,
        "title": "Firebase Integration",
        "description":
            "Seamless integration of real-time databases, authentication, cloud storage, and push notifications.",
      },
      {
        "icon": Icons.brush_rounded,
        "title": "UI/UX Design",
        "description":
            "Creating stunning, responsive interfaces with smooth animations and professional design principles.",
      },
      {
        "icon": Icons.map_rounded,
        "title": "Google Maps & Location",
        "description":
            "Integrating interactive maps, geolocation tracking, route drawing, and location-based services.",
      },
      {
        "icon": Icons.code_rounded,
        "title": "REST APIs & WebSockets",
        "description":
            "Connecting apps to complex RESTful APIs, secure authentication, and real-time WebSocket connections.",
      },
      {
        "icon": Icons.auto_awesome_rounded,
        "title": "AI & Hardware Integration",
        "description":
            "Embedding AI models (ChatGPT/Gemini) and connecting with Bluetooth thermal printers & POS hardware.",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
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
                Icons.work_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Services",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF181818),
                  ),
                ),
                Text(
                  "Transforming Ideas into Digital Reality",
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

        // Services Grid
        if (isMobile)
          Column(
            children: services.map((s) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: _buildServiceItem(
                  icon: s["icon"] as IconData,
                  title: s["title"] as String,
                  description: s["description"] as String,
                ),
              );
            }).toList(),
          )
        else
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildServiceItem(
                      icon: services[0]["icon"] as IconData,
                      title: services[0]["title"] as String,
                      description: services[0]["description"] as String,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: _buildServiceItem(
                      icon: services[1]["icon"] as IconData,
                      title: services[1]["title"] as String,
                      description: services[1]["description"] as String,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: _buildServiceItem(
                      icon: services[2]["icon"] as IconData,
                      title: services[2]["title"] as String,
                      description: services[2]["description"] as String,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildServiceItem(
                      icon: services[3]["icon"] as IconData,
                      title: services[3]["title"] as String,
                      description: services[3]["description"] as String,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: _buildServiceItem(
                      icon: services[4]["icon"] as IconData,
                      title: services[4]["title"] as String,
                      description: services[4]["description"] as String,
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: _buildServiceItem(
                      icon: services[5]["icon"] as IconData,
                      title: services[5]["title"] as String,
                      description: services[5]["description"] as String,
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 36,
          color: const Color(0xFFFFAE34),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF181818),
          ),
        ),
        const SizedBox(height: 8),
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
