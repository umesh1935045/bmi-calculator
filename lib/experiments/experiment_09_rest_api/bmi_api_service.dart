import 'dart:convert';
import 'package:http/http.dart' as http;

/// Experiment 9: HTTP GET, JSON parsing and error handling.
/// JSONPlaceholder provides sample data for learning; it is not a health API.
class BmiApiService {
  static final Uri _endpoint =
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

  static Future<Map<String, dynamic>> fetchDemoPost() async {
    final response =
        await http.get(_endpoint).timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw Exception('Server returned HTTP ${response.statusCode}.');
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
