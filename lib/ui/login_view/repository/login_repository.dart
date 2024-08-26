import 'package:flutter_first_ui/ui/login_view/services/login_service.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel?> login(String email, String password);
}

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginModel?> login(String email, String password) async {
    return await LoginService.login(email, password);
  }
}
