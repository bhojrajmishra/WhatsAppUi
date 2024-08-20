import 'package:flutter/material.dart';
import 'package:flutter_first_ui/ui/login_view/services/login_service.dart';
import 'package:flutter_first_ui/ui/home_view/home_view.dart';

class LoginViewModel extends ChangeNotifier {
  final BuildContext context;
  TextEditingController emailController;
  TextEditingController passwordController;

  LoginViewModel({
    required this.context,
    required this.emailController,
    required this.passwordController,
  });

  Future<void> handleLogin() async {
    if (_validateForm()) {
      final email = emailController.text;
      final password = passwordController.text;

      bool success = await LoginService.login(email, password);

      if (success) {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed')),
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
