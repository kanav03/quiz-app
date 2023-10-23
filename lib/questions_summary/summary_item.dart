import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['player_answer'] == itemData['correct_answer'];
    final playerAnswerColor = isCorrectAnswer
        ? Colors.teal
        : const Color.fromARGB(255, 247, 112, 112);

    // Calculate the available height
    const availableHeight = 400.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          questionIndex: itemData['question_index'] as int,
          isCorrect: isCorrectAnswer,
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              itemData['question'] as String,
              style: GoogleFonts.mukta(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              itemData['player_answer'] as String,
              style: TextStyle(
                color: playerAnswerColor,
                fontSize: _calculateFontSize(availableHeight, 14),
              ),
            ),
            Text(
              itemData['correct_answer'] as String,
              style: const TextStyle(
                color: Colors.teal,
              ),
            )
          ]),
        ),
      ],
    );
  }
}

double _calculateFontSize(double availableHeight, double baseFontSize) {
  // Adjust the baseFontSize based on availableHeight (You can fine-tune this as needed)
  return baseFontSize * (availableHeight / 400.0);
}
