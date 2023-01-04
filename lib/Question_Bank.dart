import 'package:flutter/foundation.dart';
import 'package:quizzler_flutter/questions.dart';

int _questionNo = 0;

class QuestionBank {
  // int _questionNo = 0;
  final List<Questions> _questions = [
    Questions('Do Sun rise in the east?', true),
    Questions('Do Sun sets in the west?', true),
    Questions('Is Delhi located in South India?', false),
  ];

  // int getnumber() {
  //   return _questionNo;
  // }

  void nextquestion() {
    if (_questionNo < _questions.length - 1) {
      _questionNo = _questionNo + 1;
    } else {
      _questionNo = _questionNo;
    }
    print(_questionNo);
    print(_questions.length);
  }

  String getquestion() {
    return _questions[_questionNo].question;
  }

  bool getanswer() {
    return _questions[_questionNo].answer;
  }

  bool isFinished() {
    if (_questionNo == _questions.length - 1) {
      if (kDebugMode) {
        print("You have reached End of Questions");
        return true;
      }
    }
    return false;
  }

  void reset() {
    _questionNo = 0;
  }

//TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

//TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

//TODO: Step 4 Part B - Create a reset() method here that sets the questionNumber back to 0.
}
