import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class MemoryQ1 extends StatefulWidget {
  const MemoryQ1({super.key});

  @override
 State<MemoryQ1> createState() => _MemoryQ1State();
}

class _MemoryQ1State extends State<MemoryQ1> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Mer') {
      QuizData.add("FRAIS");
    } else if (selectedOption == 'Montagne') {
      QuizData.add("NATUREL");
    } else if (selectedOption == 'Maison') {
      QuizData.add("SUCRE");
    } else if (selectedOption == 'Jardin') {
      QuizData.add("FRAIS");
      QuizData.add("NATUREL");
    }

    Navigator.pushNamed(context, '/memory/4');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Dans quel endroit ce souvenir a-t-il laissé son empreinte ?',
      options: const ['Mer','Montagne','Maison','Jardin','Autre'],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/category',
      onNext: handleNext,
    );
  }
}