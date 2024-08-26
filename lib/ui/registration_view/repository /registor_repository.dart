import 'package:flutter_first_ui/ui/registration_view/models/registration_model.dart';

abstract class RegistrationRepository {
  Future<bool> register(RegistrationModel model);
}
