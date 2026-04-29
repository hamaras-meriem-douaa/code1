import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';
import '../../services/wifi_service.dart';

class MemoryPositive extends StatefulWidget {
  const MemoryPositive({super.key});

  @override
  State<MemoryPositive> createState() => _MemoryPositiveState();
}

class _MemoryPositiveState extends State<MemoryPositive> {
  String? selectedOption;

  void handleNext() async {
    if (selectedOption == null) return;

    if (selectedOption == 'Joie') {
      QuizData.add("SUCRE");
      QuizData.add("FRAIS");
    } else if (selectedOption == 'Surprise') {
      QuizData.add("AUDACIEUX");
    } else if (selectedOption == 'Confiance') {
      QuizData.add("CONFIANCE");
    } else if (selectedOption == 'fièrté') {
      QuizData.add("CONFIANCE");
      QuizData.add("ATTRACTION");
    }

    await WifiService.sendToArduino();
    QuizData.reset();

    Navigator.pushNamed(context, '/complete');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Quelle émotion ressentez-vous ?',
      options: const ['Joie','Surprise','Confiance','fièrté'],
      selectedOption: selectedOption,
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/memory/2',
      onNext: handleNext,
    );
  }
}