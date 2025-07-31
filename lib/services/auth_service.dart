import 'dart:convert';
import '../api/auth_api.dart';

class AuthService {

  Future<String?> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    String role = 'user', // optional with default value
  }) async {
    final userData = {
      'username': username,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'role': role,
    };

    final response = await AuthApi.registerUser(userData);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return "User Registered Successfully";
    } else {
      try {
        final data = jsonDecode(response.body);
        return data['message'] ?? 'Registration failed';
      } catch (e) {
        return 'Registration failed';
      }
    }
  }

  Future<String?> login({
    required String username,
    required String password
  }) async {
    final credentials = {
      'username': username,
      'password': password,
    };

    final response = await AuthApi.loginUser(credentials);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      return "Login successfuly";
    } else {
      try {
        final data = jsonDecode(response.body);
        return data['message'] ?? 'Login failed';
      } catch (e) {
        return 'Login failed';
      }
    }
  }


}
