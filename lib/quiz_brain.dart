import 'Questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _index = 0;
  //underscore is used for private access modifiers
  List<Questions> _questionBank = [
    Questions('Is your name Megha Bansal? ', true),
    Questions('Are you an engineer ', true),
    Questions('Do you live in Pune? ', false),
  ];
  void nextQuestion() {
    if (_index < _questionBank.length - 1) {
      _index++;
    }
  }

  bool isFinished() {
    if (_index >= _questionBank.length - 1) {
      print('returning true');
      return true;
    }
    return false;
  }

  void reset() {
    _index = 0;
  }

  String getText() {
    return _questionBank[_index].questionText;
  }

  bool getAns() {
    return _questionBank[_index].questionAnswer;
  }
}
