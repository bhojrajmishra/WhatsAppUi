import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response_model.dart';

abstract class LoginRepository {
  Future<LoginResponseModel?> requestLoginApi(LoginModel loginModel);
}
