
import 'package:flutter/material.dart';
import 'package:portfolio_project/responsive/responsive.dart';

import 'components/drawer.dart';
import 'home_view.dart';
import 'about_view.dart';

class DeveloperPortfolio extends StatefulWidget {
   DeveloperPortfolio({super.key});

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  State<DeveloperPortfolio> createState() => _DeveloperPortfolioState();
}

class _DeveloperPortfolioState extends State<DeveloperPortfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._globalKey,
      backgroundColor: Colors.white,
      endDrawer: Responsive.isMobile(context) ? MyDrawer(scrollController: widget._scrollController): null,
      body: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
              controller: widget._scrollController,
              child: Column(
                children: [
                  HomeView(),
                  AboutView(),
                ],
              ),
            )
          ],)
      ),
    );
  }
}
// complete littele bit home page...
// now i am starting again my portfolio site.