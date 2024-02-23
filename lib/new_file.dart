
import 'package:flutter/material.dart';

class MyHoverText extends StatefulWidget {
  final String letter;

  const MyHoverText(this.letter, {super.key});

  @override
  _MyHoverTextState createState() => _MyHoverTextState();
}

class _MyHoverTextState extends State<MyHoverText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _colorAnimation = ColorTween(
      begin: const Color(0xFF187BCD),
      end: const Color(0xFF03254C),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.alias,
      onHover: (event) {}, // Stylish cursor
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Text(
            widget.letter,
            style: TextStyle(
              color: _colorAnimation.value,
              fontFamily: 'GigaSans',
              fontSize: 200.0,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
