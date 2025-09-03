import 'package:job_ghar/model/user/user.dart';

class LoginUser extends BaseUser{
  String email;
  String password;

  LoginUser({
    required this.email,
    required this.password,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      email: json['email'],
      password: json['password'],
    );
  }
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
