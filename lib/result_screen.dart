import 'package:dice_rolling/data/questions.dart';
import 'package:dice_rolling/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectAnswer = summaryData
        .where((item) => item['user_answer'] == item['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              'You answered $numCorrectAnswer out of $numTotalQuestions questions correctly !'),
          const SizedBox(
            height: 24,
          ),
          QuestionsSummary(summaryData: summaryData),
          TextButton(
            onPressed: () {},
            child: const Text('Restart Quiz !'),
          )
        ]),
      ),
    );
  }
}
