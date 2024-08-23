import 'package:flutter_first_ui/ui/login_view/services/login_service.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';

class LoginRepository {
  Future<LoginModel?> login(String email, String password) async {
    return await LoginService.login(email, password);
  }
}
