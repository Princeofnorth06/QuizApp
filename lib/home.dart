import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.startquiz, {super.key});
  final void Function() startquiz;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange, Color.fromARGB(255, 236, 72, 61)])),
      child: Column(
        children: [
          const SizedBox(
            height: 210,
          ),
          Center(
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Learn Flutter in Fun Way!',
            style: GoogleFonts.autourOne(
                fontSize: 24,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: startquiz,
            icon: const Icon(Icons.arrow_forward),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          ),
        ],
      ),
    );
  }
}
