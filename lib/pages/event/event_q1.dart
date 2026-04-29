import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class EventQ1 extends StatefulWidget {
  const EventQ1({super.key});

  @override
  State<EventQ1> createState() => _EventQ1State();
}

class _EventQ1State extends State<EventQ1> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Quotidien') {
      QuizData.add("FRAIS");
    } else if (selectedOption == 'Travail') {
      QuizData.add("CONFIANCE");
    } else if (selectedOption == 'Mariage') {
      QuizData.add("ATTRACTION");
    } else if (selectedOption == 'Soirée') {
      QuizData.add("CHAUD");
    }

    Navigator.pushNamed(context, '/event/2');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Dans quel contexte souhaitez-vous utiliser ce parfum ?',
      options: const [
        'Quotidien',
        'Travail',
        'Mariage',
        'Soirée',
      ],
      selectedOption: selectedOption,
      onSelect: (option) => setState(() => selectedOption = option),
      onBackRoute: '/category',
      onNext: handleNext,
    );
  }
}