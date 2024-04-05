import 'package:flutter/material.dart';
import 'package:quizz_app/quiz.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var appQuiz = Quiz();
  String str = '';

  void handleAnswer(bool value) {
    if (appQuiz.getCorrectAnswer() == value) {
      setState(() {
        str = '$str+';
      });
    } else {
      setState(() {
        str = '$str-';
      });
    }
    setState(() {
      appQuiz.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Center(
                  child: Text(
                    appQuiz.getQuestionText(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FilledButton(
                      onPressed: () {
                        handleAnswer(true);
                      },
                      child: const Text('True'),
                    ),
                    FilledButton(
                      onPressed: () {
                        handleAnswer(false);
                      },
                      child: const Text('False'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  str,
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
