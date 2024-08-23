import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class LoginService {
  static Future<LoginModel?> login(String email, String password) async {
    final payload = {
      'username': email,
      'password': password,
    };
    debugPrint("Payload: $payload");
    try {
      Response response = await Dio().post(
        ApiPath.loginUrl,
        data: payload,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return LoginModel.fromJson(data);
      } else {
        debugPrint('Login failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
