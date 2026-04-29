import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';
import '../../services/wifi_service.dart';

class EventQ4 extends StatefulWidget {
  const EventQ4({super.key});

  @override
  State<EventQ4> createState() => _EventQ4State();
}

class _EventQ4State extends State<EventQ4> {
  String? selectedOption;

  void handleNext() async {
    if (selectedOption == null) return;

    if (selectedOption == 'Plus de confiance') {
      QuizData.add("CONFIANCE");
    } else if (selectedOption == 'De la sérénité') {
      QuizData.add("SERENITE");
    } else if (selectedOption == "Un regain d'énergie") {
      QuizData.add("ENERGIE");
    } else if (selectedOption == 'Une sensation de chaleur') {
      QuizData.add("CHAUD");
    } else if (selectedOption == "Plus d'attraction") {
      QuizData.add("ATTRACTION");
    }

    // 🔥 إرسال واحد فقط
    await WifiService.sendToArduino();

    // إعادة تعيين
    QuizData.reset();

    Navigator.pushNamed(context, '/complete');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Que souhaitez-vous que le parfum vous apporte ?',
      options: const [
        'Plus de confiance',
        'De la sérénité',
        "Un regain d'énergie",
        'Une sensation de chaleur',
        "Plus d'attraction",
      ],
      selectedOption: selectedOption,
      onSelect: (option) => setState(() => selectedOption = option),
      onBackRoute: '/event/3',
      onNext: handleNext,
    );
  }
}