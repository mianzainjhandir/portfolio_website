

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContectView extends StatefulWidget {
  const ContectView({super.key});

  @override
  State<ContectView> createState() => _ContectViewState();
}

class _ContectViewState extends State<ContectView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Orange Icon
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF9800),
                      Color(0xFFFF5722),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withValues(alpha: 0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.contact_mail,
                  color: Colors.white,
                  size: 32,
                ),
              ),

              const SizedBox(width: 20),

              // Heading and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get In Touch',
                      style: GoogleFonts.poppins(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF252525),
                        height: 1.15,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "Let's discuss your next Flutter project",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
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
}
