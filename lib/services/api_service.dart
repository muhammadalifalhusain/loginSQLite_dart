import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coba_dart/models/user.dart';

class ApiService {
  static const String apiUrl = 'http://localhost:8000/api';

  // Fungsi untuk login
  Future<User?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  // Fungsi untuk register
  Future<User?> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }
}
