import 'package:flutter_first_ui/ui/registration_view/models/registration_model.dart';
import 'package:flutter_first_ui/ui/registration_view/models/registration_response_model.dart';
import 'package:flutter_first_ui/ui/registration_view/repository%20/registor_repository.dart';
import 'package:flutter_first_ui/ui/registration_view/services/registration_service.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  @override
  Future<RegistrationResponseModel?> requestRegisterApi(
      RegistrationModel registrationModel) async {
    return await RegistrationService.requestRegisterApi(registrationModel);
  }
}
