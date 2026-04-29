import 'package:flutter/material.dart';
import '../../widgets/quiz_layout.dart';
import '../../services/quiz_data.dart';

class EventQ3 extends StatefulWidget {
  const EventQ3({super.key});

  @override
  State<EventQ3> createState() => _EventQ3State();
}

class _EventQ3State extends State<EventQ3> {
  String? selectedOption;

  void handleNext() {
    if (selectedOption == null) return;

    if (selectedOption == 'Doux') {
      QuizData.add("SUCRE");
    } else if (selectedOption == 'Forts') {
      QuizData.add("AUDACIEUX");
    }

    Navigator.pushNamed(context, '/event/4');
  }

  @override
  Widget build(BuildContext context) {
    return QuizLayout(
      question: 'Préférez-vous les senteurs plutôt doux ou forts ?',
      options: const [
        'Doux',
        'Forts',
      ],
      selectedOption: selectedOption,
      onSelect: (option) => setState(() => selectedOption = option),
      onBackRoute: '/event/2',
      onNext: handleNext,
    );
  }
}