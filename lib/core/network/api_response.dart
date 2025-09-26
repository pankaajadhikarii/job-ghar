class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic)? fromData,
  }) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: fromData != null ? fromData(json['data']) : json['data'],
    );
  }
}
