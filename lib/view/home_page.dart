
import 'package:flutter/material.dart';
import 'package:portfolio_project/responsive/responsive.dart';
import 'package:portfolio_project/utills/colors.dart';
import 'package:portfolio_project/view/components/profile_and_intro.dart';
import 'package:portfolio_project/view/components/topBar.dart';

import 'components/drawer.dart';

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