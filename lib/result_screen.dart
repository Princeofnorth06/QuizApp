import 'package:flutter/material.dart';
import 'package:quizs_app/data/questions.dart';
import 'package:quizs_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });
  final void Function() onRestart;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQuestions = questions.length;

    final numCorrectQuestions = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange, Color.fromARGB(255, 236, 72, 61)])),
      child: SizedBox(
          width: double.infinity,
          child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have answered $numCorrectQuestions out of $numTotalQuestions answer correctly:)',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  QuestionsSummary(summarydata),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                    onPressed: onRestart,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Restart Quiz!'),
                  )
                ],
              ))),
    );
  }
}
