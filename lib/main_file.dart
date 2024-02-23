import 'package:flutter/material.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  Color _textColor =
      const Color(0XFF187BCD); // Initial text color (adjust based on design)
  double leg = 0;
  Offset offset = Alignment.center.alongOffset(Offset.zero);
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
              MouseRegion(
                cursor: SystemMouseCursors.alias,
                onHover: (_) {
                  setState(
                    () {
                      _textColor = const Color(0XFF03254c);
                      final relativeX =
                          _.localPosition.dx / context.size!.width;
                      leg = relativeX;
                      offset = _.localPosition;
                    },
                  );
                },
                onEnter: (_) {
                  setState(
                    () {
                      _textColor = const Color(0XFF03254c);
                      final relativeX =
                          _.localPosition.dx / context.size!.width;
                      leg = relativeX;
                      offset = _.localPosition;
                    },
                  );
                },
                onExit: (_) {
                  setState(
                    () {
                      offset = _.localPosition;
                      _textColor = const Color(0XFF187BCD);
                    },
                  );
                },
                child: ShaderMask(
                  shaderCallback: (bounds) {
                    return RadialGradient(
                      colors: [
                        _textColor,
                        const Color(0XFF187BCD),
                        const Color(0XFF187BCD),
                        const Color(0XFF187BCD),
                        const Color(0XFF187BCD)
                      ],
                      radius: 2.1,
                      tileMode: TileMode.mirror,
                      center: Alignment(offset.dx * 0.00599, offset.dy * 0.005),
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn,
                  child: const Text(
                    "FlutterBytes",
                    style: TextStyle(
                      color: Color(0XFF187BCD),
                      fontFamily: 'Locomotype GigaSansBold',
                      fontSize: 150.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Text('Community',
                  style: TextStyle(
                      fontFamily: 'Locomotype GigaSansBold',
                      fontSize: 130.0,
                      height: 0.4,
                      fontWeight: FontWeight.w200)),
            ],
          ),
        ),
      ),
    );
  }
}
