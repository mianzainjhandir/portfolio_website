
import 'package:flutter/material.dart';
import 'package:portfolio_project/responsive/responsive.dart';
import 'package:portfolio_project/utills/colors.dart';
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
        actions: [
          Responsive.isMobile(context)?
              Padding(padding: EdgeInsets.only(right: 13), child:   IconButton(
                  onPressed: (){
                    widget._globalKey.currentState?.openEndDrawer();
                  },
                  icon: Icon(Icons.menu,color: textColor,size: 35,)
              )
              ): Topbar(scrollController: widget._scrollController)
        ],
      ),
      endDrawer: Responsive.isMobile(context) ? MyDrawer(scrollController: widget._scrollController): null,
    );
  }
}
