import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_request.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response.dart';
import 'package:flutter_first_ui/utils/api_path.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  static Future<LoginResponse?> requestLoginApi(
      LoginRequest loginRequest) async {
    final payload = {
      'username': loginRequest.email,
      'password': loginRequest.password,
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
        debugPrint('Login successful with data: $data');
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token ', value: data['token']);
        debugPrint('Token saved to secure storage successfully $storage');
        return LoginResponse.fromJson(data);
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
