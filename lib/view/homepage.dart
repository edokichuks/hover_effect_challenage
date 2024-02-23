import 'package:flutter/material.dart';
import 'package:flutter_btye_chanellange/components/community.dart';
import 'package:flutter_btye_chanellange/components/flutterbytes.dart';
import 'package:flutter_btye_chanellange/constants/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              AppColors.white,
              AppColors.lightBlue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenSize.width * 0.85,
              child: const FlutterBytes(),
            ),
            SizedBox(
              width: screenSize.width * 0.8,
              child: const Community(),
            ),
          ],
        ),
      ),
    );
  }
}
