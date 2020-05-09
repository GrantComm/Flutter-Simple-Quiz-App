import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyPracticeApp());
}

class MyPracticeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPracticeAppState();
}

class _MyPracticeAppState extends State<MyPracticeApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int points) {
    _totalScore += points;

    setState(() {
      _questionIndex += 1;
    });
    print('Current Index: $_questionIndex');
    print('Current Score: $_totalScore');
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s my favorite color?',
        'answers': [
          {'text': 'Orange', 'points': 10},
          {'text': 'Red', 'points': 5},
          {'text': 'Green', 'points': 3},
          {'text': 'White', 'points': 1}
        ]
      },
      {
        'questionText': 'What\s my favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'points': 1},
          {'text': 'Dog', 'points': 3},
          {'text': 'Cat', 'points': 10},
          {'text': 'Snake', 'points': 5}
        ]
      },
      {
        'questionText': 'What\s my favorite weather',
        'answers': [
          {'text': 'Sunny', 'points': 1},
          {'text': 'Rainy', 'points': 10},
          {'text': 'Snowy', 'points': 3},
          {'text': 'Cloudy', 'points': 5}
        ]
      },
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Simple Quiz App'),
            centerTitle: true,
            backgroundColor: Colors.orange,
          ),
          body: Center(
            child: _questionIndex < _questions.length
                ? Quiz(_answerQuestion, _questions, _questionIndex)
                : Result(_totalScore, _resetQuiz),
          ),
        ));
  }
}
