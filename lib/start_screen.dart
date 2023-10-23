import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300.0,
            color: const Color.fromARGB(172, 243, 242, 240),
          ),
          const SizedBox(height: 80.0),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.mukta(
              color: const Color.fromARGB(255, 236, 205, 111),
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 30.0),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
