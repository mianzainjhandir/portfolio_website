
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
