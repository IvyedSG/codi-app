import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';

class AuthService {
  // Actualiza con tu IP real que obtuviste
  static const String baseUrl = 'http://192.168.33.146:8000';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Store token and user info
        await _secureStorage.write(key: 'auth_token', value: data['token']);
        await _secureStorage.write(key: 'user_data', value: jsonEncode(data['user']));
        return {'success': true, 'data': data};
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        return {'success': false, 'error': 'Credenciales inválidas'};
      } else {
        return {'success': false, 'error': 'Error del servidor'};
      }
    } catch (e) {
      return {'success': false, 'error': 'Error de conexión: ${e.toString()}'};
    }
  }
  
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }
  
  Future<User?> getUser() async {
    final userData = await _secureStorage.read(key: 'user_data');
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    return null;
  }
  
  Future<String?> getUserName() async {
    final user = await getUser();
    return user?.nombre;
  }
  
  Future<String?> getUserEmail() async {
    final user = await getUser();
    return user?.correo;
  }
  
  Future<void> logout() async {
    await _secureStorage.delete(key: 'auth_token');
    await _secureStorage.delete(key: 'user_data');
  }
}