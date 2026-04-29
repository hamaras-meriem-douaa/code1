import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class PersonalityQ3 extends StatefulWidget {
  const PersonalityQ3({super.key});

  @override
  State<PersonalityQ3> createState() => _PersonalityQ3State();
}

class _PersonalityQ3State extends State<PersonalityQ3> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'été') {
      QuizData.add("FRAIS");
    } else if (selectedOption == 'Hiver') {
      QuizData.add("CHAUD");
    }

    Navigator.pushNamed(context, '/personality/4');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: "Quelle saison préférez-vous ?",
      options: const ['été','Printemps','Automne','Hiver'],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/personality/2',
      onNext: handleNext,
    );
  }
}