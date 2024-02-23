import 'package:flutter/material.dart';
import 'package:flutter_btye_chanellange/constants/app_colors.dart';
import 'package:flutter_btye_chanellange/components/shade_on_hover_text.dart';

class FlutterBytes extends StatelessWidget {
  const FlutterBytes({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShadeOnHover(
      child: FittedBox(
        child: Text(
          'FlutterBytes',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: -1.4,
            height: 1,
            color: AppColors.lightBlue,
          ),
        ),
      ),
    );
  }
}
