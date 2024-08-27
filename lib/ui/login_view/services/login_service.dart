import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response_model.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class LoginService {
  static Future<LoginResponseModel?> requestLoginApi(
      LoginModel loginModel) async {
    final payload = {
      'username': loginModel.email,
      'password': loginModel.password,
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
        return LoginResponseModel.fromJson(data);
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
