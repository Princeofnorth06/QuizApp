import 'package:flutter/material.dart';
import 'package:quizs_app/answer_button.dart';
import 'package:quizs_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentQuestionIndex];
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(currentquestion.text,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 245, 218, 177),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  ...currentquestion.getSuffledAnswer().map((answer) {
                    return AnswerButton(
                        answerText: answer,
                        onTap: () {
                          answerQuestion(answer);
                        });
                  })
                ]),
          )),
    );
  }
}
