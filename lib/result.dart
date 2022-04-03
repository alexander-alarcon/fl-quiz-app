import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int questions;
  final int score;
  final VoidCallback resetQuiz;

  const Result(
      {required this.questions,
      required this.score,
      required this.resetQuiz,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'You made it your score is $score/$questions',
            ),
          ),
          ElevatedButton(
            onPressed: resetQuiz,
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
