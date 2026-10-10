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

  // Fallback / Initial project list based on Zain's GitHub repos
  final List<Map<String, dynamic>> _defaultProjects = [
    {
      "name": "Doctor_Appoinment",
      "displayName": "Doctor Appointment & AI Health App",
      "description":
          "AI-powered healthcare platform for finding doctors, booking appointments, managing medical documents, and getting AI-assisted health insights.",
      "language": "Flutter / AI",
      "url": "https://github.com/mianzainjhandir/Doctor_Appoinment",
      "tags": ["Flutter", "AI", "Firebase"],
    },
    {
      "name": "Streamly_App",
      "displayName": "Streamly - Video Streaming Platform",
      "description":
          "A full-stack video streaming platform built with Flutter & Firebase — upload, watch, and interact with videos on the go.",
      "language": "Flutter / Firebase",
      "url": "https://github.com/mianzainjhandir/Streamly_App",
      "tags": ["Flutter", "Firebase", "Streaming"],
    },
    {
      "name": "DocuMind",
      "displayName": "DocuMind - AI Document & Knowledge App",
      "description":
          "DocuMind is an AI-powered document management and knowledge base mobile app built for smart file search, RAG-based chat, and team collaboration.",
      "language": "Flutter / AI",
      "url": "https://github.com/mianzainjhandir/DocuMind",
      "tags": ["Flutter", "AI / RAG", "Knowledge Base"],
    },
    {
      "name": "Delivery_Boy_App",
      "displayName": "Delivery Boy Logistics App",
      "description":
          "Practice based logistics & delivery application for order tracking, live status updates, and route navigation.",
      "language": "Flutter / Maps",
      "url": "https://github.com/mianzainjhandir/Delivery_Boy_App",
      "tags": ["Flutter", "Maps", "Logistics"],
    },
    {
      "name": "chatbot_project",
      "displayName": "AI Chatbot & Assistant App",
      "description":
          "Smart AI Chatbot project integrated with Gemini & OpenAI APIs for conversational AI, natural language responses, and smart assistance.",
      "language": "Flutter / Gemini AI",
      "url": "https://github.com/mianzainjhandir/chatbot_project",
      "tags": ["Flutter", "Gemini AI", "OpenAI"],
    },
    {
      "name": "portfolio_website",
      "displayName": "Modern Flutter Portfolio Website",
      "description":
          "🚀 Modern Flutter Portfolio | Responsive UI | Smooth Animations | Clean Architecture | Projects | Skills | Built with Flutter & Dart.",
      "language": "Flutter Web",
      "url": "https://github.com/mianzainjhandir/portfolio_website",
      "tags": ["Flutter Web", "Dart", "Portfolio"],
    },
    {
      "name": "E_Commerce_App",
      "displayName": "E-Commerce Shopping Application",
      "description":
          "Full-featured mobile e-commerce platform with product catalogs, shopping cart, checkout system, and Firebase integration.",
      "language": "Flutter / Firebase",
      "url": "https://github.com/mianzainjhandir/E_Commerce_App",
      "tags": ["Flutter", "Firebase", "E-Commerce"],
    },
    {
      "name": "Expense_Tracker_App",
      "displayName": "Smart Expense Tracker App",
      "description":
          "Personal finance and budget management app built with Flutter & GetX featuring expense analytics, categories, and report charts.",
      "language": "Flutter / GetX",
      "url": "https://github.com/mianzainjhandir/Expense_Tracker_App",
      "tags": ["Flutter", "GetX", "Finance"],
    },
    {
      "name": "Weather_App",
      "displayName": "Real-Time Weather Forecast App",
      "description":
          "Live weather forecasting mobile app utilizing REST APIs, location services, dynamic weather condition themes, and 7-day forecasts.",
      "language": "Flutter / REST API",
      "url": "https://github.com/mianzainjhandir/Weather_App",
      "tags": ["Flutter", "REST API", "Weather"],
    },
    {
      "name": "Chat_App",
      "displayName": "Real-Time Chat & Messaging App",
      "description":
          "Real-time chat application with Firebase Firestore, push notifications, user authentication, and media attachment sharing.",
      "language": "Flutter / Firebase",
      "url": "https://github.com/mianzainjhandir/Chat_App",
      "tags": ["Flutter", "Firebase", "Chat"],
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
                'Flutter application project developed by Zain.';
            final String url = repo['html_url'] ??
                'https://github.com/mianzainjhandir/$rawName';
            final String lang = repo['language'] ?? 'Dart';

            fetched.add({
              "name": rawName,
              "displayName": name,
              "description": desc,
              "language": lang,
              "url": url,
              "tags": [lang, "GitHub"],
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

              // Projects Grid
              isMobile
                  ? Column(
                      children: visibleProjects
                          .map((p) => Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: _buildProjectCard(p, isMobile),
                              ))
                          .toList(),
                    )
                  : Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: visibleProjects
                          .map((p) => SizedBox(
                                width: 510,
                                child: _buildProjectCard(p, isMobile),
                              ))
                          .toList(),
                    ),

              const SizedBox(height: 36),

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
    final List<String> tags = List<String>.from(project["tags"] ?? ["Flutter"]);

    return Container(
      padding: EdgeInsets.all(isMobile ? 20.0 : 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEEEEE), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Folder Icon & GitHub Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.folder_special_rounded,
                  color: Color(0xFFFFAE34),
                  size: 24,
                ),
              ),
              InkWell(
                onTap: () => _launchUrl(project["url"]),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.code_rounded,
                    color: Color(0xFF181818),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Project Title
          Text(
            project["displayName"] ?? project["name"],
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF181818),
            ),
          ),
          const SizedBox(height: 8),

          // Project Description
          Text(
            project["description"],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              height: 1.5,
              color: const Color(0xFF666666),
            ),
          ),
          const SizedBox(height: 20),

          // Tech Tags & Link Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 8,
                children: tags.take(2).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F5F7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF555555),
                      ),
                    ),
                  );
                }).toList(),
              ),
              InkWell(
                onTap: () => _launchUrl(project["url"]),
                child: Row(
                  children: [
                    Text(
                      "GitHub",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFAE34),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: Color(0xFFFFAE34),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
