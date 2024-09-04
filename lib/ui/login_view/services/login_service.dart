import 'package:dio/dio.dart';
import 'package:flutter_first_ui/base/logging_interceptor.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_request.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response.dart';
import 'package:flutter_first_ui/utils/api_path.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  LoginService() : _dio = Dio() {
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    final payload = {
      'username': loginRequest.email,
      'password': loginRequest.password,
    };
    try {
      Response response = await _dio.post(
        ApiPath.loginUrl,
        data: payload,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        await _storage.write(key: 'token', value: data['token']);
        return LoginResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }
}
