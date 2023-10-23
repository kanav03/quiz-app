import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:quiz_app/splach_screen/dialog_utils.dart'; // Import CupertinoAlertDialog

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> choosenAnswers;

  List<Map<String, Object>> get summaryDatas {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      //loop body
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'player_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  // New method to show the Cupertino dialog using DialogUtils
  Future<void> _showCupertinoDialog(BuildContext context) async {
    final result = await DialogUtils.showExitConfirmationDialog(context);
    if (result == true) {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = summaryDatas;
    final numTotalQuest = questions.length;
    final numCorrectQuest = summaryData
        .where(
          (data) => data['player_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your answered $numCorrectQuest out of $numTotalQuest questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.mukta(
                color: Colors.amber,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            QuestionSummarry(summaryData: summaryData),
            const SizedBox(height: 30.0),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.lato(
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            ),
            TextButton.icon(
              onPressed: () => _showCupertinoDialog(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.mukta(
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(Icons.exit_to_app),
              label: const Text('exit app'),
            ),
          ],
        ),
      ),
    );
  }
}
