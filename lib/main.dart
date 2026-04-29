import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pages/welcome_page.dart';
import 'pages/category_page.dart';
import 'pages/complete_page.dart';

import 'pages/personality/personality_q1.dart';
import 'pages/personality/personality_q2.dart';
import 'pages/personality/personality_q3.dart';
import 'pages/personality/personality_q4.dart';

import 'pages/mood/mood_q1.dart';
import 'pages/mood/mood_q2.dart';
import 'pages/mood/mood_q3.dart';
import 'pages/mood/mood_q4.dart';

import 'pages/memory/memory_q1.dart';
import 'pages/memory/memory_q2.dart';
import 'pages/memory/memory_positive.dart';
import 'pages/memory/memory_negative.dart';

import 'pages/event/event_q1.dart';
import 'pages/event/event_q2.dart';
import 'pages/event/event_q3.dart';
import 'pages/event/event_q4.dart';

import 'pages/allergies_page.dart';

/// ================== ARDUINO SERVICE ==================

class ArduinoService {
  static const String baseUrl = "http://192.168.1.100";

  static Future<void> send(String code) async {
    final url = Uri.parse("$baseUrl/data?value=$code");

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));
      debugPrint("Sent: $code | ${response.statusCode}");
    } catch (e) {
      debugPrint("Error sending $code: $e");
    }
  }

  static Future<void> sendEvent(int n) async => send("E$n");
  static Future<void> sendPersonality(int n) async => send("P$n");
  static Future<void> sendMood(int n) async => send("H$n");
  static Future<void> sendMemory(int n) async => send("M$n");

  static Future<void> startMix() async => send("START");
  static Future<void> reset() async => send("RESET");
}

/// ================== MAIN ==================

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF9A8D4),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const WelcomePage(),
        '/category': (context) => const CategoryPage(),
        '/complete': (context) => const CompletePage(),

        // Personality
        '/personality/1': (context) => const PersonalityQ1(),
        '/personality/2': (context) => const PersonalityQ2(),
        '/personality/3': (context) => const PersonalityQ3(),
        '/personality/4': (context) => const PersonalityQ4(),

        // Mood
        '/mood/1': (context) => const MoodQ1(),
        '/mood/2': (context) => const MoodQ2(),
        '/mood/3': (context) => const MoodQ3(),
        '/mood/4': (context) => const MoodQ4(),

        // Memory
        '/memory/1': (context) => const MemoryQ1(),
        '/memory/2': (context) => const MemoryQ2(),
        '/memory/positive': (context) => const MemoryPositive(),
        '/memory/negative': (context) => const MemoryNegative(),

        // Event
        '/event/1': (context) => const EventQ1(),
        '/event/2': (context) => const EventQ2(),
        '/event/3': (context) => const EventQ3(),
        '/event/4': (context) => const EventQ4(),

        '/allergies': (context) => const AllergiesPage(),
      },
    );
  }
}