import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrect});

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30.0,
      height: 30.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.teal : Colors.red,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.mukta(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
