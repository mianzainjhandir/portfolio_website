
import 'package:flutter/material.dart';
import 'package:portfolio_project/responsive/responsive.dart';

class ProfileAndIntro extends StatelessWidget {
  const ProfileAndIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            SizedBox(
              width: Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context)
                  : Responsive.widthOfScreen(context)/2,
              height:  Responsive.isMobile(context)
                  ? Responsive.heightOfScreen(context)/3
                  : Responsive.heightOfScreen(context) -70,
              child: Image.asset('assets/images/profile_pic.png'),
            )
          ],
        )
      ],
    );
  }
}
