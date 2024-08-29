import 'package:flutter_first_ui/ui/login_view/models/login_request.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse?> requestLoginApi(LoginRequest loginRequest);
}
