import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  const Quiz({
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _question = (questions[questionIndex]['question'] as String);
    var answers = (questions[questionIndex]['answers'] as List<String>)
        .map((e) => Answer(() {
              answerQuestion(
                  e, questions[questionIndex]['correctAnswer'] as String);
            }, e))
        .toList();

    answers.shuffle();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Question('${questionIndex + 1}. $_question'),
          ...answers,
        ],
      ),
    );
  }
}
