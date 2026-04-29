import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';
import '../../services/wifi_service.dart';

class MoodQ4 extends StatefulWidget {
  const MoodQ4({super.key});

  @override
  State<MoodQ4> createState() => _MoodQ4State();
}

class _MoodQ4State extends State<MoodQ4> {
  String? selectedOption;

  void handleNext() async {
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

    await WifiService.sendToArduino();
    QuizData.reset();

    Navigator.pushNamed(context, '/complete');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Choisissez une dernière préférence :',
      options: const [
        'Fraîches et légères',
        'Chaudes et douces',
        'Fortes et audacieuses',
        'Sucrées et réconfortantes',
        'Naturelles et vertes',
      ],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/mood/3',
      onNext: handleNext,
    );
  }
}