import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_response.dart';

class NetworkApiService {
  Future<ApiResponse<dynamic>> postResponse(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers ?? {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      final Map<String, dynamic> json = jsonDecode(response.body);
      return ApiResponse.fromJson(json);
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
  }

  Future<ApiResponse<dynamic>> getResponse(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers ?? {"Content-Type": "application/json"},
      );

      final Map<String, dynamic> json = jsonDecode(response.body);
      return ApiResponse.fromJson(json);
    } catch (e) {
      return ApiResponse(success: false, message: e.toString());
    }
  }
}
