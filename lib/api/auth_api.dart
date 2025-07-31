import 'dart:convert';
import 'package:http/http.dart' as http;


class AuthApi {
  static const String baseUrl = 'http://localhost:8000/api';

  static Future<http.Response> registerUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/register');

    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );
  }
}
