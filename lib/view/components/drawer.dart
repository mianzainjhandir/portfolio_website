
import 'package:flutter/material.dart';
import 'package:portfolio_project/utills/colors.dart';

class MyDrawer extends StatelessWidget {
  final ScrollController scrollController;

  const MyDrawer({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.close,color: textColor,
            ),
        ),
      ),
    );
  }
}

// still facing errors ....
//today i cant write any code because i am stduying for my exams so please write the code for me and make sure it is error free