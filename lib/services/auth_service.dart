import 'dart:convert';
import '../api/auth_api.dart';

class AuthService {
  Future<String?> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
  }) async {
    final userData = {
      'username': username,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'role': role
    };

    final response = await AuthApi.registerUser(userData);

    if (response.statusCode == 200) {
      return null;
    } else {
      final data = jsonDecode(response.body);
      return data['message'] ?? 'Registration failed';
    }
  }
}