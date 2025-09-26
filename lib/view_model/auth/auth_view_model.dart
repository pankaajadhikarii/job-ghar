import 'package:flutter/foundation.dart';
import 'package:job_ghar/core/services/auth_service.dart';
import 'package:job_ghar/model/user/user.dart';
import 'package:job_ghar/core/services/shared_prefs_service.dart';
import 'package:job_ghar/core/network/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthServices _authServices = AuthServices();

  User? _user;
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;
  bool _registrationSuccess = false;

  VoidCallback? onLogoutCallback;

  User? get user => _user;
  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get registrationSuccess => _registrationSuccess;
  bool get isLoggedIn => _user != null && _token != null;

  void setLogoutCallback(VoidCallback callback) => onLogoutCallback = callback;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final ApiResponse<Map<String, dynamic>> response =
          await _authServices.login(email: email, password: password);

      if (response.success && response.data != null) {
        _token = response.data!['accessToken'];
        final role = response.data!['role'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token ?? '');
        await prefs.setString('role', role ?? '');

        _user = User(
          id: 0,
          name: '',
          email: email,
          role: role ?? '',
          age: 0,
          isProfileComplete: false,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message ?? "Login failed";
      }
    } catch (e) {
      _errorMessage = "Network error: $e";
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> register({
    required String name,
    required String role,
    required String email,
    required int age,
    required String password,
    required String confirmPassword,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _registrationSuccess = false;
    notifyListeners();

    try {
      final ApiResponse<Map<String, dynamic>> response = await _authServices.register(
        name: name,
        role: role,
        email: email,
        age: age,
        password: password,
        confirmPassword: confirmPassword,
      );

      if (response.success && response.data != null) {
        _registrationSuccess = true;

        _token = response.data!['accessToken'];
        if (_token != null) await SharedPrefsService.saveToken(_token!);

        _user = User.fromJson(response.data!);

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.message ?? "Registration failed";
      }
    } catch (e) {
      _errorMessage = "Network error: $e";
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _user = null;
    _token = null;
    await SharedPrefsService.clearToken();
    notifyListeners();

    if (onLogoutCallback != null) onLogoutCallback!();
  }

  Future<void> loadUserFromPrefs() async {
    _token = await SharedPrefsService.getToken();
    if (_token != null) {
      _user ??= User(
        id: 0,
        name: '',
        email: '',
        role: '',
        age: 0,
        isProfileComplete: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    }
    notifyListeners();
  }

  void resetRegistrationState() {
    _registrationSuccess = false;
    _errorMessage = null;
    notifyListeners();
  }
}
