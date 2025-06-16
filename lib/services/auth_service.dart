//auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://172.20.10.8:5157/api';
  // o el dominio real de tu backend

  Future<bool> register(String username, String password) async {
    final url =
        Uri.parse('$baseUrl/register'); // Asegurate que esta URL sea correcta

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      print("Código de respuesta: ${response.statusCode}");
      print("Respuesta del backend: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error de conexión: $e");
      return false;
    }
  }

  Future<void> updatePassword(String newPassword) async {
    final username = await getUsername();

    if (username == null) return;

    await http.put(
      Uri.parse('$baseUrl/cambiar-contrasena'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': username,
        'nuevaContrasena': newPassword,
      }),
    );
  }

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        await prefs.setString('username', username);
        await prefs.setInt('userId', data['userId']);
        return true;
      } else {
        // login fallido
        return false;
      }
    } catch (e) {
      print("Error en login: $e");
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }
}
