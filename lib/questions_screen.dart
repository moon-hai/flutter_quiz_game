import 'package:dice_rolling/answer_button.dart';
import 'package:dice_rolling/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onTap});

  final void Function(String answer) onTap;

  @override
  State createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIdx = 0;

  void answerQuestion(String answer) {
    widget.onTap(answer);

    if (currentQuestionIdx < questions.length - 1) {
      setState(() {
        currentQuestionIdx += 1;
      });
    }
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIdx];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ...currentQuestion.shuffleAnswer.map((item) {
              return AnswerButton(
                  label: item,
                  onTap: () {
                    answerQuestion(item);
                  });
            })
          ],
        ),
      ),
    );
  }
}
