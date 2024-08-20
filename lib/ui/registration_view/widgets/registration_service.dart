import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class RegistrationService {
  static Future<bool> register(String email, String fullName, String password,
      BuildContext context) async {
    final payload = {
      'email': email,
      'full_name': fullName,
      'password': password,
    };
    debugPrint("Payload: $payload");
    try {
      final response = await Dio().post(
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
      return false;
    }
  }
}
