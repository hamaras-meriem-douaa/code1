import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class EventQ2 extends StatefulWidget {
  const EventQ2({super.key});

  @override
  State<EventQ2> createState() => _EventQ2State();
}

class _EventQ2State extends State<EventQ2> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Fraîs et légèrs') {
      QuizData.add("FRAIS");
    } else if (selectedOption == 'Chauds et doucs') {
      QuizData.add("CHAUD");
    } else if (selectedOption == 'Forts et audacieus') {
      QuizData.add("AUDACIEUX");
    } else if (selectedOption == 'Sucrés et réconfortants') {
      QuizData.add("SUCRE");
    } else if (selectedOption == 'Naturels et verts') {
      QuizData.add("NATUREL");
    }

    Navigator.pushNamed(context, '/event/3');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Préférez-vous actuellement des senteurs :',
      options: const [
        'Fraîs et légèrs',
        'Chauds et doucs',
        'Forts et audacieus',
        'Sucrés et réconfortants',
        'Naturels et verts',
      ],
      selectedOption: selectedOption,
      onSelect: (option) => setState(() => selectedOption = option),
      onBackRoute: '/event/1',
      onNext: handleNext,
    );
  }
}