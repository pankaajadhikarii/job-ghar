import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<bool> logoutUser() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('auth_token'); 
  if (token == null) return false;

  final response = await http.get(
    Uri.parse('https://jobghar-backend.onrender.com/auth/logout'),
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': '*/*',
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body); 
    if (jsonResponse['success'] == true) {
      await prefs.remove('auth_token'); 
      return true;
    }
  }
  return false; 
}
