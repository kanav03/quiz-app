import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 1.0, end: 0.2).animate(curve);
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        // Animation is completed, navigate to the Quiz screen
        Navigator.pushReplacementNamed(context, '/quiz');
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FadeTransition(
        opacity: animation,
        child: const FlutterLogo(),
      ),
    );
  }
}
