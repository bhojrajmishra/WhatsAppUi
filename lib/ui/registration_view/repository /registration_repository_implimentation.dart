import 'package:flutter_first_ui/ui/registration_view/models/registration_request.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_response.dart';
import 'package:flutter_first_ui/ui/registration_view/repository%20/registor_repository.dart';
import 'package:flutter_first_ui/ui/registration_view/services/registration_service.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  @override
  Future<RegistrationResponse?> requestRegisterApi(
      RegistrationRequest registrationRequest) async {
    return await RegistrationService.requestRegisterApi(registrationRequest);
  }
}
