import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class MoodQ3 extends StatefulWidget {
  const MoodQ3({super.key});

  @override
  State<MoodQ3> createState() => _MoodQ3State();
}

class _MoodQ3State extends State<MoodQ3> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Fraîches et légères') {
      QuizData.add("FRAIS");
    } else if (selectedOption == 'Chaudes et douces') {
      QuizData.add("CHAUD");
    } else if (selectedOption == 'Fortes et audacieuses') {
      QuizData.add("AUDACIEUX");
    } else if (selectedOption == 'Sucrées et réconfortantes') {
      QuizData.add("SUCRE");
    } else if (selectedOption == 'Naturelles et vertes') {
      QuizData.add("NATUREL");
    }

    Navigator.pushNamed(context, '/mood/4');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Préférez-vous actuellement des senteurs :',
      options: const [
        'Fraîches et légères',
        'Chaudes et douces',
        'Fortes et audacieuses',
        'Sucrées et réconfortantes',
        'Naturelles et vertes',
      ],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/mood/2',
      onNext: handleNext,
    );
  }
}