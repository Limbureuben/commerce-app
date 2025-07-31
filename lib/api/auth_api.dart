import 'dart:convert';
import 'package:http/http.dart' as http;


class AuthApi {
  static const String baseUrl = 'http://192.168.224.163:8000/api';

  static Future<http.Response> registerUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/register');

    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );
  }


  static Future<http.Response> loginUser(Map<String, dynamic> credentials) async {
    final url = Uri.parse('$baseUrl/login');

    return await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(credentials),
    );
  }


}
