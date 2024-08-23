import 'package:flutter_first_ui/ui/registration_view/services/registration_service.dart';

class RegistrationRepository {
  Future<bool> register(String email, String name, String password) async {
    return await RegistrationService.register(email, name, password);
  }
}
