import 'dart:io';
import 'quiz_data.dart';

class WifiService {
  static Future<void> sendToArduino() async {
    try {
      Socket socket = await Socket.connect('192.168.4.1', 80);

      String message = QuizData.buildMessage();

      socket.write(message + "\n");
      await socket.flush();
      socket.close();

      print("Sent: $message");
    } catch (e) {
      print("Error: $e");
    }
  }
}