import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class MoodQ2 extends StatefulWidget {
  const MoodQ2({super.key});

  @override
  State<MoodQ2> createState() => _MoodQ2State();
}

class _MoodQ2State extends State<MoodQ2> {
  String? selectedOption;

  void handleNext() {
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

    Navigator.pushNamed(context, '/mood/3');
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
      onSelect: (o) => setState(() => selectedOption = o),
      onBackRoute: '/mood/1',
      onNext: handleNext,
    );
  }
}