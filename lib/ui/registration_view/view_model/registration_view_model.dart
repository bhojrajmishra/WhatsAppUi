import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/registration_view/services/registration_service.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';

class RegistrationViewModel extends ChangeNotifier {
  Future<void> handleRegistration(
      BuildContext context, String email, String password, String name) async {
    if (_validateForm(context, email, password, name)) {
      bool success = await RegistrationService.register(email, name, password);

      if (context.mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration failed')),
          );
        }
      }
    }
  }

  bool _validateForm(
      BuildContext context, String email, String password, String name) {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email is required')),
      );
      return false;
    }
    return true;
  }
}
