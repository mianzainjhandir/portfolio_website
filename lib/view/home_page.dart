
import 'package:flutter/material.dart';
import 'package:portfolio_project/utills/colors.dart';

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
        title: const Text(
            "Zain Khaliq",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: textColor
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 3,
        toolbarHeight: 70,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: textColor,size: 35,))],
      ),
    );
  }
}
