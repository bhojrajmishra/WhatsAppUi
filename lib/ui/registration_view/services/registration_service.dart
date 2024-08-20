import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class RegistrationService {
  static Future<bool> register(
    String email,
    String name,
    String password,
  ) async {
    final payload = {
      'username': email,
      'name': name,
      'password': password,
    };
    try {
      Response response = await Dio().post(
        ApiPath.registerUrl,
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
      return false;
    }
  }
}
