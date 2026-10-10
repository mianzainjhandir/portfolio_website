import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../responsive/responsive.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  bool _isExpanded = false;
  List<Map<String, dynamic>> _projects = [];

  // Initial / Fallback project list matching Zain's GitHub repos
  final List<Map<String, dynamic>> _defaultProjects = [
    {
      "name": "Doctor_Appoinment",
      "displayName": "Doctor Appointment & AI Health App",
      "description":
          "AI-powered healthcare platform for finding doctors, booking appointments, managing medical documents, and getting AI-assisted health insights.",
      "url": "https://github.com/mianzainjhandir/Doctor_Appoinment",
    },
    {
      "name": "Streamly_App",
      "displayName": "Streamly - Video Streaming Platform",
      "description":
          "A full-stack video streaming platform built with Flutter & Firebase — upload, watch, and interact with videos on the go.",
      "url": "https://github.com/mianzainjhandir/Streamly_App",
    },
    {
      "name": "DocuMind",
      "displayName": "DocuMind - AI Document & Knowledge App",
      "description":
          "DocuMind is an AI-powered document management and knowledge base mobile app built for smart file search, RAG-based chat, and team collaboration.",
      "url": "https://github.com/mianzainjhandir/DocuMind",
    },
    {
      "name": "Delivery_Boy_App",
      "displayName": "Delivery Boy Logistics App",
      "description":
          "Practice based logistics & delivery application for order tracking, live status updates, and route navigation.",
      "url": "https://github.com/mianzainjhandir/Delivery_Boy_App",
    },
    {
      "name": "chatbot_project",
      "displayName": "AI Chatbot & Assistant App",
      "description":
          "Smart AI Chatbot project integrated with Gemini & OpenAI APIs for conversational AI, natural language responses, and smart assistance.",
      "url": "https://github.com/mianzainjhandir/chatbot_project",
    },
    {
      "name": "portfolio_website",
      "displayName": "Modern Flutter Portfolio Website",
      "description":
          "🚀 Modern Flutter Portfolio | Responsive UI | Smooth Animations | Clean Architecture | Projects | Skills | Built with Flutter & Dart.",
      "url": "https://github.com/mianzainjhandir/portfolio_website",
    },
    {
      "name": "E_Commerce_App",
      "displayName": "E-Commerce Shopping Application",
      "description":
          "Full-featured mobile e-commerce platform with product catalogs, shopping cart, checkout system, and Firebase integration.",
      "url": "https://github.com/mianzainjhandir/E_Commerce_App",
    },
    {
      "name": "Expense_Tracker_App",
      "displayName": "Smart Expense Tracker App",
      "description":
          "Personal finance and budget management app built with Flutter & GetX featuring expense analytics, categories, and report charts.",
      "url": "https://github.com/mianzainjhandir/Expense_Tracker_App",
    },
    {
      "name": "Weather_App",
      "displayName": "Real-Time Weather Forecast App",
      "description":
          "Live weather forecasting mobile app utilizing REST APIs, location services, dynamic weather condition themes, and 7-day forecasts.",
      "url": "https://github.com/mianzainjhandir/Weather_App",
    },
    {
      "name": "Chat_App",
      "displayName": "Real-Time Chat & Messaging App",
      "description":
          "Real-time chat application with Firebase Firestore, push notifications, user authentication, and media attachment sharing.",
      "url": "https://github.com/mianzainjhandir/Chat_App",
    },
  ];

  @override
  void initState() {
    super.initState();
    _projects = List.from(_defaultProjects);
    _fetchGitHubProjects();
  }

  Future<void> _fetchGitHubProjects() async {
    try {
      final response = await http
          .get(
            Uri.parse(
                "https://api.github.com/users/mianzainjhandir/repos?sort=updated&per_page=100"),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          final List<Map<String, dynamic>> fetched = [];
          for (var repo in data) {
            if (repo['fork'] == true) continue;
            final String rawName = repo['name'] ?? '';
            final String name = rawName.replaceAll('_', ' ');
            final String desc = repo['description'] ??
                'A Flutter project showcasing modern development practices and clean architecture.';
            final String url = repo['html_url'] ??
                'https://github.com/mianzainjhandir/$rawName';

            fetched.add({
              "name": rawName,
              "displayName": name,
              "description": desc,
              "url": url,
            });
          }

          if (fetched.isNotEmpty && mounted) {
            setState(() {
              _projects = fetched;
            });
          }
        }
      }
    } catch (e) {
      debugPrint("Using default projects list fallback: $e");
    }
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
      debugPrint("Could not launch project URL: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final int displayCount = _isExpanded ? _projects.length : 8;
    final List<Map<String, dynamic>> visibleProjects =
        _projects.take(displayCount).toList();

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
              // Header Row: My Projects
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
                        "My Projects",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF181818),
                        ),
                      ),
                      Text(
                        "Professional Flutter Applications & Solutions",
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

              // Projects Grid (3 Columns on Desktop, 1 on Mobile)
              LayoutBuilder(
                builder: (context, constraints) {
                  final double availableWidth = constraints.maxWidth;
                  int crossAxisCount = 3;
                  if (isMobile || availableWidth < 650) {
                    crossAxisCount = 1;
                  } else if (availableWidth < 950) {
                    crossAxisCount = 2;
                  }

                  final double cardWidth =
                      (availableWidth - ((crossAxisCount - 1) * 24)) /
                          crossAxisCount;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: visibleProjects.map((p) {
                      return SizedBox(
                        width: cardWidth,
                        child: _buildProjectCard(p, isMobile),
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 40),

              // See More / View All Repositories Button
              if (_projects.length > 8)
                Center(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      if (!_isExpanded) {
                        setState(() {
                          _isExpanded = true;
                        });
                      } else {
                        // Open GitHub Repositories directly
                        _launchUrl(
                            "https://github.com/mianzainjhandir?tab=repositories");
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      side: const BorderSide(
                        color: Color(0xFFFFAE34),
                        width: 1.8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Icon(
                      _isExpanded
                          ? Icons.open_in_new_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: const Color(0xFFFFAE34),
                    ),
                    label: Text(
                      _isExpanded
                          ? "View All Repositories on GitHub"
                          : "See More Projects",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFAE34),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project, bool isMobile) {
    final String displayName =
        project["displayName"] ?? project["name"] ?? "Flutter App";
    final String description = project["description"] ?? "";
    final String url = project["url"] ?? "https://github.com/mianzainjhandir";

    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Dark Octocat Watermark Background
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF1B1B1E),
              child: Center(
                child: Opacity(
                  opacity: 0.85,
                  child: Container(
                    width: 210,
                    height: 210,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF26262B),
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      size: 110,
                      color: Color(0xFF121214),
                    ),
                  ),
                ),
              ),
            ),

            // Black Gradient Overlay at bottom for clear text visibility
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.35),
                    Colors.black.withValues(alpha: 0.95),
                  ],
                  stops: const [0.35, 0.65, 1.0],
                ),
              ),
            ),

            // Content at Bottom of Card
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      height: 1.4,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Bottom Action Buttons
                  Row(
                    children: [
                      InkWell(
                        onTap: () => _launchUrl(url),
                        borderRadius: BorderRadius.circular(8),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.code_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () => _launchUrl(url),
                        borderRadius: BorderRadius.circular(8),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.open_in_new_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
