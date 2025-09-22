import 'package:job_ghar/model/user/base_user.dart';

// Register User Model
class RegisterUser extends BaseUser {
  final int id;
  final String name;
  final String email;
  final String password;
  final String? accessToken;
  final String role;
  final int age;
  final bool isProfileComplete;
  final DateTime createdAt;
  final DateTime updatedAt;

  RegisterUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.accessToken,
    required this.role,
    required this.age,
    required this.isProfileComplete,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      accessToken: json['accessToken'],
      role: json['role'],
      age: json['age'],
      isProfileComplete: json['isProfileComplete'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'accessToken': accessToken,
      'role': role,
      'age': age,
      'isProfileComplete': isProfileComplete,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}


// Login User Model
class LoginUser extends BaseUser {
  final String accessToken;
  final String role;

  LoginUser({
    required this.accessToken,
    required this.role,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      accessToken: json['accessToken'],
      role: json['role'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'role': role,
    };
  }
}