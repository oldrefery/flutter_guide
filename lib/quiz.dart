import 'package:flutter/material.dart';
import 'package:flutter_guide/answer.dart';

import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText']),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) => Answer(
                answerText: answer['text'],
                answerHandler: () => answerQuestion(answer['score']),
              ))
          .toList(),
    ]);
  }
}
