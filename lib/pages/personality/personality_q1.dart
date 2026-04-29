import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class PersonalityQ1 extends StatefulWidget {
  const PersonalityQ1({super.key});

  @override
  State<PersonalityQ1> createState() => _PersonalityQ1State();
}

class _PersonalityQ1State extends State<PersonalityQ1> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Rester seule') {
      QuizData.add("SERENITE");
    } else {
      QuizData.add("ATTRACTION");
    }

    Navigator.pushNamed(context, '/personality/2');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Après une longue journée, préférez-vous ?',
      options: const ['Rester seule','Sortir avec des amies'],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/category',
      onNext: handleNext,
    );
  }
}