import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/registration_view/services/registration_service.dart';
import 'package:flutter_first_ui/ui/login_view/login_view.dart';

class RegistrationViewModel extends ChangeNotifier {
  final BuildContext context;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  RegistrationViewModel({
    required this.context,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });

  Future<void> handleRegistration() async {
    if (_validateForm()) {
      final email = emailController.text;
      final password = passwordController.text;
      final name = nameController.text;

      bool success = await RegistrationService.register(email, name, password);

      if (context.mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration failed')),
          );
        }
      }
    }
  }

  bool _validateForm() {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email is required')),
      );
      return false;
    }
    return true;
  }
}
