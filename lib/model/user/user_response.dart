import 'package:job_ghar/model/user/base_user.dart';
import 'package:job_ghar/model/user/user.dart';

class UserResponse extends BaseUser {
  final bool success;
  final String message;
  final User data;

  UserResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'],
      message: json['message'],
      data: User.fromJson(json['data']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}
