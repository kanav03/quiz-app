import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/splach_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash1(), // Display SplashScreen as the first screen
      routes: {
        // Define your other routes here (e.g., quiz screen)
        '/quiz': (context) => const Quiz(),
      },
    );
  }
}
