import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;
  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = "Quiz Complete";
    if (resultScore == 30) {
      resultText = "AYYEE, PERFECT SCORE!";
    }if(resultScore <= 20) {
      resultText = " A little SHABY!";
    }if(resultScore <= 10) {
      resultText = "PRETTY BAD!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        RaisedButton(
          child: Text(
            'Restart Quiz',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.orange,
          onPressed: () {
            resetQuiz();
          },
        )
      ],
    );
  }
}
