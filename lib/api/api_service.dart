import 'package:flutter_gemini/flutter_gemini.dart';

class ApiService {
  final gemini = Gemini.instance;

  // сгенерировать текст
  Future<String> generateFate(String date) async {
    try {
      final value = await gemini.prompt(
        parts: [
          Part.text(
            'Предскажи судьбу по дате рождения: $date. Ответ дай коротко в нескольких абзацах.',
          ),
        ],
      );
      return value?.output ?? 'Нет данных!';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
