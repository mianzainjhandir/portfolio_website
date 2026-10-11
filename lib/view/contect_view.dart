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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Center(
        child: Text(
          "Contact Section",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
