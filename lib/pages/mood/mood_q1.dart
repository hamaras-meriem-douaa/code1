import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class MoodQ1 extends StatefulWidget {
  const MoodQ1({super.key});

  @override
  State<MoodQ1> createState() => _MoodQ1State();
}

class _MoodQ1State extends State<MoodQ1> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Heureux / Optimiste') {
      QuizData.add("SUCRE");
      QuizData.add("FRAIS");
    } else if (selectedOption == 'Calme / Détendue') {
      QuizData.add("SERENITE");
    } else if (selectedOption == 'Triste / Faible énergie') {
      QuizData.add("ENERGIE");
    } else if (selectedOption == 'Strèssèe / Anxieuse') {
      QuizData.add("SERENITE");
    } else if (selectedOption == 'Enthousiaste / Dynamique') {
      QuizData.add("ENERGIE");
    }

    Navigator.pushNamed(context, '/mood/2');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Comment décrivez-vous votre état actuel ?',
      options: const [
        'Heureux / Optimiste',
        'Calme / Détendue',
        'Triste / Faible énergie',
        'Strèssèe / Anxieuse',
        'Enthousiaste / Dynamique',
      ],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/category',
      onNext: handleNext,
    );
  }
}