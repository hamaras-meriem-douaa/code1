import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';
import '../../services/wifi_service.dart';

class MemoryNegative extends StatefulWidget {
  const MemoryNegative({super.key});

  @override
  State<MemoryNegative> createState() => _MemoryNegativeState();
}

class _MemoryNegativeState extends State<MemoryNegative> {
  String? selectedOption;

  void handleNext() async {
    if (selectedOption == null) return;

    QuizData.add("SERENITE");

    if (selectedOption == 'Colère') {
      QuizData.add("CHAUD");
    }

    await WifiService.sendToArduino();
    QuizData.reset();

    Navigator.pushNamed(context, '/complete');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Quelle émotion ressentez-vous ?',
      options: const ['Tristesse','Colère','Peur','jalousie'],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/memory/2',
      onNext: handleNext,
    );
  }
}