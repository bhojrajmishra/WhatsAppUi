import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_model.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_response_model.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class RegistrationService {
  static Future<RegistrationResponseModel?> requestRegisterApi(
      RegistrationModel registrationModel) async {
    final payload = {
      'email': registrationModel.email,
      'full_name': registrationModel.fullname,
      'password': registrationModel.password,
    };
    debugPrint("Payload: $payload");
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

      if (response.statusCode == 200) {
        final data = response.data;
        return RegistrationResponseModel.fromJson(data);
      } else {
        debugPrint('Registration failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
