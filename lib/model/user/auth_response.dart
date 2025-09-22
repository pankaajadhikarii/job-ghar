import 'package:job_ghar/model/user/auth_requests.dart';
import 'package:job_ghar/model/user/base_user.dart';


// Register Response
class RegisterUserResponse extends BaseUser {
  final bool success;
  final String message;
  final RegisterUser? data;

  RegisterUserResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisterUserResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? RegisterUser.fromJson(json['data']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}


// Login Response
class LoginUserResponse extends BaseUser {
  final bool success;
  final String message;
  final LoginUser? data;

  LoginUserResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    return LoginUserResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? LoginUser.fromJson(json['data']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}