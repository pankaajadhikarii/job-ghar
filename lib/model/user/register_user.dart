import 'package:job_ghar/model/user/user.dart';

class RegisterUser extends BaseUser{
  String name;
  String role;
  String email;
  int age;
  String password;
  String confirmPassword;

  RegisterUser({
    required this.name,
    required this.role,
    required this.email,
    required this.age,
    required this.password,
    required this.confirmPassword,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      name: json['name'],
      role: json['role'],
      email: json['email'],
      age: json['age'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'email': email,
      'age': age,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
