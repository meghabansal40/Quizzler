import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // a score keeper list
  List<Icon> scoreKeeper = [];
  QuizBrain qB = new QuizBrain();

  void checkAns(bool userAns) {
    setState(
      () {
        if (qB.isFinished() == true) {
          Alert(
                  context: context,
                  title: "Finished",
                  desc: "You have reached the end of the quiz")
              .show();
          qB.reset();
          scoreKeeper = [];
        } else {
          if (qB.getAns() == userAns) {
            scoreKeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            scoreKeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          qB.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              //'${questions[index]}'
              qB.getText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.green),
              ),
              onPressed: () {
                checkAns(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.red),
              ),
              onPressed: () {
                checkAns(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
