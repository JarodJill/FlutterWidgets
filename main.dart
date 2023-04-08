import 'package:firstui/question.dart';
import 'package:firstui/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\s your favourite color?',
      'answer': [
        {'text': 'Black', 'score': 7},
        {'text': 'Red', 'score': 2},
        {'text': 'Yellow', 'score': 6},
        {'text': 'Blue', 'score': 4}
      ]
    },
    {
      'questionText': 'What\s your favourite animal?',
      'answer': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 7},
        {'text': 'Bird', 'score': 3},
        {'text': 'Turtle', 'score': 2}
      ]
    },
    {
      'questionText': 'What\s your favourite Food?',
      'answer': [
        {'text': 'Pizza', 'score': 3},
        {'text': 'Salad', 'score': 7},
        {'text': 'Sushi', 'score': 9},
        {'text': 'Burger', 'score': 2}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState((){
    _questionIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore = _totalScore + score;
    
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
