import "package:flutter/material.dart";
import "./question.dart";
import "./answer.dart";

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions; 
  final Function answerQuestion; 
  final int questionIndex; 
  Quiz(this.answerQuestion, this.questions, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: <Widget>[
                    Question(
                      questions[questionIndex]['questionText'],
                    ),
                    ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
                        .map((answer) {
                      return Answer(() => answerQuestion(answer['points']), answer['text']);
                    }).toList(),
                  ],
                ); 
  }
}