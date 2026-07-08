
import 'package:flutter/material.dart';
import 'package:portfolio_project/responsive/responsive.dart';
import 'package:portfolio_project/utills/colors.dart';

class Topbar extends StatelessWidget {
  final ScrollController  scrollController;
  const Topbar({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return isMobile ? Column(
      children:
        topBarData(scrollController, context, isMobile: true)
    ) : Row(
      children:
      topBarData(scrollController, context )

    );
    
  }
  List<Widget> topBarData(
      ScrollController scrollController, BuildContext context,
  {bool isMobile = false}){
    int scrollDuration = isMobile ? 800 : 500;
    return [
      Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
      child: TextButton(
          onPressed: (){},
          child: const Text(
            "About",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: textColor),),
      ),
      ),
      Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: TextButton(
          onPressed: (){},
          child: const Text(
            "Skills",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: textColor),),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: TextButton(
          onPressed: (){},
          child: const Text(
            "Projects",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: textColor),),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
        child: TextButton(
          onPressed: (){},
          child: const Text(
            "Contact",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: textColor),),
        ),
      )
    ];
  }
}
