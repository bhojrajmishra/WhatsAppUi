// Update the RegistrationRepository interface to match the return type
import 'package:flutter_first_ui/ui/registration_view/models/registration_model.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_response.dart';

abstract class RegistrationRepository {
  Future<RegistrationResponse?> requestRegisterApi(
      RegistrationRequest registrationRequest);
}
