import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_model.dart';
import 'package:flutter_first_ui/utils/api_path.dart';

class RegistrationService {
  static Future<bool> register(RegistrationModel model) async {
    try {
      Response response = await Dio().post(
        ApiPath.registerUrl,
        data: model.toJson(),
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
