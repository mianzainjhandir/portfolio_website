
import 'package:flutter/material.dart';

class DeveloperPortfolio extends StatefulWidget {
  const DeveloperPortfolio({super.key});

  @override
  State<DeveloperPortfolio> createState() => _DeveloperPortfolioState();
}

class _DeveloperPortfolioState extends State<DeveloperPortfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Portfolio Website"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
