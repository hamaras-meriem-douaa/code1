import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';
import '../../services/wifi_service.dart';

class PersonalityQ4 extends StatefulWidget {
  const PersonalityQ4({super.key});

  @override
  State<PersonalityQ4> createState() => _PersonalityQ4State();
}

class _PersonalityQ4State extends State<PersonalityQ4> {
  String? selectedOption;

  void handleNext() async {
    if (selectedOption == null) return;

    if (selectedOption == 'Calme') {
      QuizData.add("SERENITE");
    } else if (selectedOption == 'Sociable') {
      QuizData.add("ATTRACTION");
    } else if (selectedOption == 'Élégante') {
      QuizData.add("CONFIANCE");
    } else if (selectedOption == 'Adventurieuse') {
      QuizData.add("ENERGIE");
    }

    await WifiService.sendToArduino();
    QuizData.reset();

    Navigator.pushNamed(context, '/complete');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Comment vous perçoit-on ?',
      options: const [
        'Calme',
        'coquette',
        'Sociable',
        'Mystérieuse',
        'Élégante',
        'Adventurieuse',
      ],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/personality/3',
      onNext: handleNext,
    );
  }
}