import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_btye_chanellange/main_file.dart';
import 'package:flutter_btye_chanellange/new_file.dart';
import 'package:flutter_btye_chanellange/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var cursorPosition = const Point<num>(0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(Colors.indigo[100], Colors.blue[100], 0.7),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromRGBO(197, 216, 232, 1),
            Color.fromARGB(255, 200, 230, 254),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var letter in "FlutterByte".split(''))
                    Stack(
                      children: [
                        MyHoverText(letter),
                        MyHoverText1(letter),
                      ],
                    ),
                ],
              ),
              MouseRegion(
                onHover: (event) {
                  debugPrint('Mouse movement ${event.pointer}');
                },
                child: const Text(
                  'Community',
                  style: TextStyle(
                    fontSize: 128,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHoverText1 extends StatefulWidget {
  final String letter;

  const MyHoverText1(this.letter, {super.key});

  @override
  _MyHoverText1State createState() => _MyHoverText1State();
}

class _MyHoverText1State extends State<MyHoverText1> {
  Offset cursorPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    final textSize = TextPainter(
      text: TextSpan(
        text: widget.letter,
        style: TextStyle(
          color: Colors.indigo[700],
          fontFamily: 'GigaSans',
          fontSize: 200.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    ).layout(maxWidth: double.infinity);

    return MouseRegion(
      cursor: SystemMouseCursors.alias,
      onHover: (event) => setState(() => cursorPosition = event.localPosition),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.blue.withAlpha((1)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipPath(
          clipper: CircleClipper(cursorPosition),
          child: Text(
            widget.letter,
            style: TextStyle(
              color: Colors.indigo[700],
              fontFamily: 'GigaSans',
              fontSize: 200.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  final Offset cursorPosition;

  const CircleClipper(this.cursorPosition);

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCenter(
          center: cursorPosition,
          width: size.width,
          height: size.height,
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>
      !identical(oldClipper, this);
  //  =>
  // oldClipper.cursorPosition != cursorPosition;
}

class CustomShapeWidget extends StatelessWidget {
  final Color color;
  final double size;
  final Point cursorPosition;

  const CustomShapeWidget({
    Key? key,
    required this.color,
    required this.size,
    required this.cursorPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomShapePainter(color, size, cursorPosition),
      child: const Text(
        'FlutterByte',
        style: TextStyle(fontSize: 100),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  final Color color;
  final double size;
  final Point cursorPosition;

  CustomShapePainter(this.color, this.size, this.cursorPosition);

  @override
  void paint(Canvas canvas, Size size) {
    // Use Path to draw your desired shape (e.g., circle, square, triangle)
    // Position the shape based on `cursorPosition` and adjust size as needed
    // final path = Path()..addPath(Path(),cursorPosition, size / 2);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(Path(), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
