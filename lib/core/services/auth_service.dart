import 'package:job_ghar/core/network/api_constants.dart';
import 'package:job_ghar/core/network/api_response.dart';
import 'package:job_ghar/core/network/network_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  final NetworkApiService _apiService = NetworkApiService();

  Future<ApiResponse<Map<String, dynamic>>> login({
  required String email,
  required String password,
}) async {
  final ApiResponse<dynamic> response = await _apiService.postResponse(
    ApiConstants.login,
    {"email": email, "password": password},
  );

  if (response.success && response.data != null && response.data is Map) {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "token", response.data['accessToken'] ?? '');
    await prefs.setString(
        "role", response.data['role'] ?? '');
  }

  return ApiResponse<Map<String, dynamic>>(
    success: response.success,
    message: response.message,
    data: response.data != null && response.data is Map
        ? Map<String, dynamic>.from(response.data)
        : null,
  );
}


Future<ApiResponse<Map<String, dynamic>>> register({
  required String name,
  required String role,
  required String email,
  required int age,
  required String password,
  required String confirmPassword,
}) async {
  final ApiResponse<dynamic> response = await _apiService.postResponse(
    ApiConstants.register,
    {
      "name": name,
      "role": role,
      "email": email,
      "age": age,
      "password": password,
      "confirmPassword": confirmPassword,
    },
  );

  if (response.success && response.data != null && response.data is Map) {
    final prefs = await SharedPreferences.getInstance();
    if (response.data['accessToken'] != null) {
      await prefs.setString("token", response.data['accessToken']);
    }
  }

  return ApiResponse<Map<String, dynamic>>(
    success: response.success,
    message: response.message,
    data: response.data != null && response.data is Map
        ? Map<String, dynamic>.from(response.data)
        : null,
  );
}


  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("role");
  }
}
