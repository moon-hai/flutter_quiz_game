import 'package:dice_rolling/data/questions.dart';
import 'package:dice_rolling/questions_screen.dart';
import 'package:dice_rolling/result_screen.dart';
import 'package:dice_rolling/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget activeScreenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      activeScreenWidget = QuestionsScreen(onTap: chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      activeScreenWidget = ResultScreen(
        selectedAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: activeScreenWidget),
    ));
  }
}
