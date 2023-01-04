import 'package:flutter/foundation.dart';
import 'package:quizzler_flutter/Question_Bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

QuestionBank bank = QuestionBank();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Quizzler(),
            ),
          )),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> checklist = [];

  void showicon(bool i) {
    setState(() {
      if (QuestionBank().isFinished()) {
        //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If true, execute Part       A, B, C, D.
        //TODO: Step 4 Part A - show an alert using rFlutter_alert (remember to read the docs for the           package!).
        Alert(
                context: context,
                title: "End of Questions",
                desc: "You have attempted all questions.")
            .show();
        //HINT! Step 4 Part B is in the quiz_brain.dart
        //TODO: Step 4 Part C - reset the questionNumber,
        QuestionBank().reset();
        //TODO: Step 4 Part D - empty out the scoreKeeper.
        checklist = [];
        //TODO: Step 5 - If we've not reached the end, ELSE do the answer checking steps below 👇
      } else {
        if (bank.getanswer() == i) {
          if (kDebugMode) {
            // print('User picked Right answer');
            checklist.add(const Icon(
              Icons.check,
              color: Colors.green,
            ));
          }
        } else {
          if (kDebugMode) {
            // print('User Picked Wrong Answer');
            checklist.add(const Icon(
              Icons.close,
              color: Colors.red,
            ));
          }
        }
        //The user picked true.

        QuestionBank().nextquestion();
      }
    });
  }

  // List<String> questions = [
  //   'Do Sun rise in the east?',
  //   'Do Sun sets in the west?',
  //   'Is Delhi located in South India?'
  // ];

  // List<bool> answers = [true, true, false];

  // int i = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                bank.getquestion(),
                // 'This is where the question text will go.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
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
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green),
              // textColor: Colors.white,
              // color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                showicon(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red),
              // textColor: Colors.white,
              // color: Colors.green,
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                showicon(false);
              },
            ),
          ),
        ),
        Row(
          children: checklist,
        )
      ],
    );
  }
}
