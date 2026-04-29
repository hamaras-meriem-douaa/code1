import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class PersonalityQ2 extends StatefulWidget {
  const PersonalityQ2({super.key});

  @override
  State<PersonalityQ2> createState() => _PersonalityQ2State();
}

class _PersonalityQ2State extends State<PersonalityQ2> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Oui') {
      QuizData.add("ATTRACTION");
    } else {
      QuizData.add("SERENITE");
    }

    Navigator.pushNamed(context, '/personality/3');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: "Exprimez-vous facilement vos émotions ?",
      options: const ['Oui','Non','Seulement avec les proches'],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/personality/1',
      onNext: handleNext,
    );
  }
}