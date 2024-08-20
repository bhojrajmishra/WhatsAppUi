import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class LoginService {
  static Future<bool> login(
      String email, String password, BuildContext context) async {
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

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
      return false;
    }
  }
}
