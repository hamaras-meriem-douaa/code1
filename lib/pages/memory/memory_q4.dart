import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class MemoryQ4 extends StatefulWidget {
  const MemoryQ4({super.key});

  @override
  State<MemoryQ4> createState() => _MemoryQ4State();
}

class _MemoryQ4State extends State<MemoryQ4> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == ' doux et floral') {
      QuizData.add("SUCRE");
    } else {
      QuizData.add("ATTRACTION");
    }

    Navigator.pushNamed(context, '/memory/2');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Quel parfum vous ferait revivre ce moment ?',
      options: const [' doux et floral',' intense et envoûtant'],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/memory/1',
      onNext: handleNext,
    );
  }
}