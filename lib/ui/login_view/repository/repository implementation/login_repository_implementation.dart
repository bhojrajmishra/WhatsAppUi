import 'package:flutter_first_ui/ui/login_view/models/login_model.dart';
import 'package:flutter_first_ui/ui/login_view/models/login_response_model.dart';
import 'package:flutter_first_ui/ui/login_view/repository/login_repository.dart';
import 'package:flutter_first_ui/ui/login_view/services/login_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<LoginResponseModel?> requestLoginApi(LoginModel loginModel) async {
    return await LoginService.requestLoginApi(loginModel);
  }
}
