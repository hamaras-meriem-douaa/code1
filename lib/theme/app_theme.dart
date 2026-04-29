
import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color pinkLight = Color(0xFFFCE7F3);
  static const Color pink = Color(0xFFF9A8D4);
  static const Color pinkDark = Color(0xFFF472B6);
  static const Color purple = Color(0xFFE9D5FF);
  static const Color purpleDark = Color(0xFFC084FC);
  static const Color beige = Color(0xFFFEF3C7);
  static const Color textDark = Color(0xFF374151);
  static const Color textLight = Color(0xFF6B7280);

  // Gradient
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFDF2F8), // pink-50
      Color(0xFFFFF1F2), // rose-50
      Color(0xFFFAF5FF), // purple-50
    ],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFF9A8D4), // pink-300
      Color(0xFFD8B4FE), // purple-300
    ],
  );

  static const LinearGradient iconGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFBCFE8), // pink-200
      Color(0xFFE9D5FF), // purple-200
    ],
  );
}
