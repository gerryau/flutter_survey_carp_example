import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_survey/surveys.dart';
import 'package:research_package/research_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  title: "Instructions",
  detailText:
      "For the upcoming questions choose the answer closest to how you feel",
  footnote: "(1) Important footnote",
  // imagePath: "assets/images/waving-hand.png",
  text:
      "Please indicate for each of the five statements which is closest to how you have been feeling over the last two weeks. Notice that higher numbers mean better well-being.",
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NPSScorePage()),
          );
        },
        child: const Text('Pending Survey'),
      ),
    );
  }
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

void resultCallback(RPTaskResult result) {
  // Do anything with the result
  // print(_encode(result));
  printWrapped(_encode(result));
}

class NPSScorePage extends StatelessWidget {
  const NPSScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: linearSurveyTask,
      onSubmit: resultCallback,
    );
  }
}
