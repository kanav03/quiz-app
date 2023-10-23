import 'package:flutter/material.dart';
import 'package:quiz_app/asnwer_button.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onselectAnswer});

  final void Function(String answer) onselectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onselectAnswer(selectedAnswer);
    setState(() {
      // currQestionIndex = currQestionIndex + 1;
      // currQestionIndex += 1;
      currQuestionIndex++; //increment the value by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              style: GoogleFonts.mukta(
                color: const Color.fromARGB(255, 224, 161, 243),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            ...currentQuestions.shuffleAnswer.map((answer) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                  const SizedBox(
                      height: 5.0) // Add the desired spacing between buttons
                ],
              );
            }),
            //the map list is the same with the buttom but more shorter ang easy
            // AnswerButton(
            //   answerText: currentQuestions.answerrs[0],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestions.answerrs[1],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestions.answerrs[2],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: currentQuestions.answerrs[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
