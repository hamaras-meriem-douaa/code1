import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';

class MemoryQ2 extends StatefulWidget {
  const MemoryQ2({super.key});

  @override
  State<MemoryQ2> createState() => _MemoryQ2State();
}

class _MemoryQ2State extends State<MemoryQ2> {
  String? selectedOption;

  void handleContinue() {
    if (selectedOption == 'Positif') {
      Navigator.pushReplacementNamed(context, '/memory/positive');
    } else if (selectedOption == 'Négatif') {
      Navigator.pushReplacementNamed(context, '/memory/negative');
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question:
          'Ce souvenir que vous souhaitez capturer dans un flacon est-il plutôt :',
      options: const [
        'Positif',
        'Négatif',
      ],
      selectedOption: selectedOption,
      onSelect: (option) => setState(() => selectedOption = option),
      onBackRoute: '/memory/1',
      onContinue: handleContinue,
    );
  }
}