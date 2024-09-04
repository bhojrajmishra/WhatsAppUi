import 'package:flutter_first_ui/ui/login_view/models/login_request.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response.dart';
import 'package:flutter_first_ui/ui/login_view/repository/login_repository.dart';
import 'package:flutter_first_ui/ui/login_view/services/login_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest) async {
    final loginService = LoginService();
    return await loginService.requestLoginApi(loginRequest);
  }

  @override
  Future<String?> getToken() async {
    final loginService = LoginService();
    return await loginService.getToken();
  }
}
