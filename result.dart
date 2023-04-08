import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are below average';
    } else if (resultScore < 15) {
      resultText = 'You are average';
    } else if (resultScore < 20) {
      resultText = 'You are better';
    } else {
      resultText = 'You are the best';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        ElevatedButton(
            onPressed: resetHandler,
            child: Text('Reset Quiz!'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ))
      ],
    ));
  }
}
